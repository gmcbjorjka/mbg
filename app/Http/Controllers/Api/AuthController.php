<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\Models\User;

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

    public function register(Request $request)
    {
        $request->validate([

            'name' => 'required|string|max:255',

            'email' => 'nullable|email|unique:users,email',

            'phone' => 'required|string|unique:users,phone',

            'password' => 'required|min:8|confirmed',

            'address' => 'required',

            'beneficiary_type' => 'required',

        ], [

            'phone.unique' => 'Nomor HP sudah terdaftar',

            'email.unique' => 'Email sudah terdaftar',

        ]);



        $user = User::create([

            'name' => $request->name,

            'email' => $request->email,

            'phone' => $request->phone,

            'password' => Hash::make(
                $request->password
            ),


            'role' => 'user',

            'status' => 'inactive',

        ]);



        $user->profile()->create([

            'address' => $request->address,

            'beneficiary_type' =>
                $request->beneficiary_type,

        ]);



        return response()->json([

            'message' =>
            'Registrasi berhasil, menunggu aktivasi admin',

            'user' =>
            $user->load('profile')

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
