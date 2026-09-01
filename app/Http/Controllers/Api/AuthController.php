<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\Models\User;
use App\Models\RegisterOtp;
use App\Mail\SendOtpMail;
use Illuminate\Support\Facades\Mail;
use Carbon\Carbon;

class AuthController extends Controller
{
    public function login(Request $request)
    {
        $request->validate([
            'login' => 'required',
            'password' => 'required'
        ]);


        $field = filter_var(
            $request->login,
            FILTER_VALIDATE_EMAIL
        )
            ? 'email'
            : 'phone';


        $user = User::with('profile')
    ->where(
        $field,
        $request->login
    )
    ->first();


        if (!$user || !Hash::check($request->password, $user->password)) {

            return response()->json([
                'message' => 'Email/telepon atau password salah'
            ], 401);

        }


        // khusus aplikasi mobile
        if ($user->role !== 'user') {

            return response()->json([
                'message' => 'Akun tidak tersedia untuk aplikasi mobile'
            ], 403);

        }


        if ($user->status !== 'active') {

            return response()->json([
                'message' => 'Akun belum aktif'
            ], 403);

        }


        $token = $user
            ->createToken('mbg-mobile')
            ->plainTextToken;


        return response()->json([
            'token' => $token,
            'user' => $user
        ]);
    }

    public function me(Request $request)
    {
        return response()->json($request->user());
    }

    /**
     * Kirim OTP untuk Registrasi Akun
     */
    public function sendRegisterOtp(Request $request)
    {
        $request->validate([
            'email' => 'required|email|unique:users,email',
        ], [
            'email.required' => 'Email wajib diisi',
            'email.email' => 'Format email tidak valid',
            'email.unique' => 'Email sudah terdaftar',
        ]);

        $otp = str_pad(random_int(0, 999999), 6, '0', STR_PAD_LEFT);

        RegisterOtp::updateOrCreate(
            ['email' => $request->email],
            [
                'otp' => $otp,
                'expired_at' => Carbon::now()->addMinutes(5),
                'verified' => false,
            ]
        );

        try {
            Mail::to($request->email)->send(new SendOtpMail($otp, 'register', 5));
        } catch (\Exception $e) {
            \Illuminate\Support\Facades\Log::error('Failed sending register OTP: ' . $e->getMessage());
            return response()->json([
                'success' => false,
                'message' => 'Gagal mengirim email OTP. Pastikan konfigurasi email sudah benar.',
            ], 500);
        }

        return response()->json([
            'success' => true,
            'message' => 'Kode OTP berhasil dikirim ke email Anda',
        ]);
    }

    /**
     * Cek Verifikasi OTP Registrasi (Opsional)
     */
    public function verifyRegisterOtp(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'otp' => 'required|digits:6',
        ], [
            'email.required' => 'Email wajib diisi',
            'email.email' => 'Format email tidak valid',
            'otp.required' => 'Kode OTP wajib diisi',
            'otp.digits' => 'Kode OTP harus berupa 6 digit angka',
        ]);

        $otpRecord = RegisterOtp::where('email', $request->email)
            ->where('otp', $request->otp)
            ->where('expired_at', '>', Carbon::now())
            ->first();

        if (!$otpRecord) {
            return response()->json([
                'success' => false,
                'message' => 'Kode OTP tidak valid atau sudah kadaluarsa',
            ], 400);
        }

        $otpRecord->update(['verified' => true]);

        return response()->json([
            'success' => true,
            'message' => 'Kode OTP valid',
        ]);
    }

    /**
     * Submit Registrasi Akun
     */
    public function register(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|email|unique:users,email',
            'phone' => 'required|string|unique:users,phone',
            'password' => 'required|min:8|confirmed',
            'address' => 'required',
            'beneficiary_type' => 'required',
            'otp' => 'required|digits:6',
        ], [
            'name.required' => 'Nama lengkap wajib diisi',
            'email.required' => 'Email wajib diisi',
            'email.email' => 'Format email tidak valid',
            'email.unique' => 'Email sudah terdaftar',
            'phone.required' => 'Nomor HP wajib diisi',
            'phone.unique' => 'Nomor HP sudah terdaftar',
            'password.required' => 'Password wajib diisi',
            'password.min' => 'Password minimal 8 karakter',
            'password.confirmed' => 'Konfirmasi password tidak cocok',
            'address.required' => 'Alamat wajib diisi',
            'beneficiary_type.required' => 'Tipe penerima manfaat wajib diisi',
            'otp.required' => 'Kode OTP wajib diisi',
            'otp.digits' => 'Kode OTP harus berupa 6 digit angka',
        ]);

        $otpRecord = RegisterOtp::where('email', $request->email)
            ->where('otp', $request->otp)
            ->where('expired_at', '>', Carbon::now())
            ->first();

        if (!$otpRecord) {
            return response()->json([
                'success' => false,
                'message' => 'Kode OTP tidak valid atau sudah kadaluarsa',
            ], 400);
        }

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'phone' => $request->phone,
            'password' => Hash::make($request->password),
            'role' => 'user',
            'status' => 'inactive',
        ]);

        $user->profile()->create([
            'address' => $request->address,
            'beneficiary_type' => $request->beneficiary_type,
        ]);

        // Hapus OTP setelah registrasi berhasil
        $otpRecord->delete();

        return response()->json([
            'success' => true,
            'message' => 'Registrasi berhasil, menunggu aktivasi admin',
            'user' => $user->load('profile'),
        ], 201);
    }

    public function changePassword(Request $request)
    {
        $request->validate([

            'current_password' => [
                'required',
            ],

            'password' => [
                'required',
                'min:8',
                'confirmed',
            ],

        ]);


        $user = auth()->user();


        if (!Hash::check(
            $request->current_password,
            $user->password
        )) {

            return response()->json([

                'success' => false,

                'message' => 'Password lama salah.'

            ], 422);

        }


        $user->update([

            'password' => Hash::make(
                $request->password
            ),

        ]);


        // logout semua perangkat

        $user->tokens()->delete();



        return response()->json([

            'success' => true,

            'message' => 'Password berhasil diubah.'

        ]);
    }


    public function logout(Request $request)
    {
        $request->user()->tokens()->delete();

        return response()->json(['message' => 'logout success']);
    }
}
