<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\PasswordResetOtp;
use App\Mail\SendOtpMail;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Log;
use Carbon\Carbon;

class ForgotPasswordController extends Controller
{
    /**
     * Kirim OTP Reset Password ke Email
     */
    public function sendOtp(Request $request)
    {
        $request->validate([
            'contact' => 'required',
        ], [
            'contact.required' => 'Email atau kontak wajib diisi',
        ]);

        $user = User::where('email', $request->contact)
            ->orWhere('phone', $request->contact)
            ->first();

        if (!$user) {
            return response()->json([
                'success' => false,
                'message' => 'Akun tidak ditemukan',
            ], 404);
        }

        if (empty($user->email)) {
            return response()->json([
                'success' => false,
                'message' => 'Akun ini tidak memiliki email terdaftar untuk menerima OTP',
            ], 400);
        }

        // Generate 6-digit OTP acak
        $otp = str_pad(random_int(0, 999999), 6, '0', STR_PAD_LEFT);

        PasswordResetOtp::updateOrCreate(
            [
                'contact' => $request->contact,
            ],
            [
                'otp' => $otp,
                'reset_token' => null,
                'expired_at' => Carbon::now()->addMinutes(5),
                'verified' => false,
            ]
        );

        // Kirim email OTP
        try {
            Mail::to($user->email)->send(new SendOtpMail($otp, 'reset_password', 5));
        } catch (\Exception $e) {
            Log::error('Failed sending forgot-password OTP: ' . $e->getMessage());
            return response()->json([
                'success' => false,
                'message' => 'Gagal mengirim email OTP. Pastikan konfigurasi email sudah benar.',
            ], 500);
        }

        return response()->json([
            'success' => true,
            'message' => 'Kode OTP reset kata sandi telah dikirim ke email Anda',
        ]);
    }

    /**
     * Verifikasi OTP Reset Password
     */
    public function verifyOtp(Request $request)
    {
        $request->validate([
            'contact' => 'required',
            'otp' => 'required|digits:6',
        ], [
            'contact.required' => 'Kontak/email wajib diisi',
            'otp.required' => 'Kode OTP wajib diisi',
            'otp.digits' => 'Kode OTP harus berupa 6 digit angka',
        ]);

        $otpData = PasswordResetOtp::where('contact', $request->contact)
            ->where('otp', $request->otp)
            ->where('expired_at', '>', Carbon::now())
            ->first();

        if (!$otpData) {
            return response()->json([
                'success' => false,
                'message' => 'OTP tidak valid atau sudah kadaluarsa',
            ], 400);
        }

        $resetToken = Str::random(60);

        $otpData->update([
            'verified' => true,
            'reset_token' => $resetToken,
        ]);

        return response()->json([
            'success' => true,
            'message' => 'OTP berhasil diverifikasi',
            'reset_token' => $resetToken,
        ]);
    }

    /**
     * Reset Password Menggunakan Reset Token
     */
    public function resetPassword(Request $request)
    {
        $request->validate([
            'contact' => 'required',
            'reset_token' => 'required',
            'password' => 'required|min:8|confirmed',
        ], [
            'contact.required' => 'Kontak/email wajib diisi',
            'reset_token.required' => 'Token reset password wajib disertakan',
            'password.required' => 'Password baru wajib diisi',
            'password.min' => 'Password minimal 8 karakter',
            'password.confirmed' => 'Konfirmasi password tidak cocok',
        ]);

        $otpData = PasswordResetOtp::where('contact', $request->contact)
            ->where('reset_token', $request->reset_token)
            ->where('verified', true)
            ->first();

        if (!$otpData) {
            return response()->json([
                'success' => false,
                'message' => 'Token reset password tidak valid',
            ], 400);
        }

        $user = User::where('email', $request->contact)
            ->orWhere('phone', $request->contact)
            ->first();

        if (!$user) {
            return response()->json([
                'success' => false,
                'message' => 'User tidak ditemukan',
            ], 404);
        }

        $user->update([
            'password' => Hash::make($request->password),
        ]);

        // Hapus data OTP setelah sukses digunakan
        $otpData->delete();

        return response()->json([
            'success' => true,
            'message' => 'Password berhasil diubah',
        ]);
    }
}
