<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\PasswordResetOtp;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Hash;
use Carbon\Carbon;

class ForgotPasswordController extends Controller
{
    /**
     * Kirim OTP Reset Password
     */
    public function sendOtp(Request $request)
    {


        $request->validate([

            'contact' => 'required',

        ]);




        $user = User::where(
            'email',
            $request->contact
        )
            ->orWhere(
                'phone',
                $request->contact
            )
            ->first();





        if (!$user) {


            return response()->json([

                'success' => false,

                'message' => 'Akun tidak ditemukan',

            ], 404);


        }







        // sementara OTP static
        // nanti diganti SMS / Email Gateway

        $otp = '123456';






        PasswordResetOtp::updateOrCreate(
            [

                'contact' => $request->contact,

            ],
            [

                'otp' => $otp,

                'reset_token' => null,

                'expired_at' => Carbon::now()
                    ->addMinutes(5),

                'verified' => false,

                'attempt' => 0,

                'used_at' => null,

            ]
        );








        return response()->json([


            'success' => true,


            'message' => 'OTP berhasil dikirim',


        ]);



    }









    /**
     * Verifikasi OTP
     */
    public function verifyOtp(Request $request)
    {


        $request->validate([


            'contact' => 'required',


            'otp' => 'required|digits:6',


        ]);







        $otpData = PasswordResetOtp::where(
            'contact',
            $request->contact
        )
            ->where(
                'otp',
                $request->otp
            )
            ->where(
                'expired_at',
                '>',
                now()
            )
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
     * Reset Password
     */
    public function resetPassword(Request $request)
    {


        $request->validate([


            'contact' => 'required',


            'reset_token' => 'required',


            'password' => 'required|min:8|confirmed',


        ]);









        $otpData = PasswordResetOtp::where(
            'contact',
            $request->contact
        )
            ->where(
                'reset_token',
                $request->reset_token
            )
            ->where(
                'verified',
                true
            )
            ->first();








        if (!$otpData) {


            return response()->json([


                'success' => false,


                'message' => 'Token reset password tidak valid',


            ], 400);


        }









        $user = User::where(
            'email',
            $request->contact
        )
            ->orWhere(
                'phone',
                $request->contact
            )
            ->first();








        if (!$user) {


            return response()->json([


                'success' => false,


                'message' => 'User tidak ditemukan',


            ], 404);


        }









        $user->update([


            'password' => Hash::make(
                $request->password
            ),


        ]);








        // hapus OTP setelah sukses

        $otpData->delete();








        return response()->json([


            'success' => true,


            'message' => 'Password berhasil diubah',


        ]);



    }


}
