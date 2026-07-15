<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class ProfileController extends Controller
{
    public function update(Request $request)
    {

        $user = auth()->user();


        $request->validate([

            'name' => 'required|string|max:255',

            'phone' => 'nullable|string|max:20',

            'email' => 'required|email',


            'address' => 'nullable|string',

            'nik' => 'nullable|string|max:20',

            'birth_date' => 'nullable|date',

            'gender' =>
                'nullable|in:male,female',

            'beneficiary_type' =>
                'nullable|in:pregnant,toddler_parent',

        ]);



        $user->update([

            'name' =>
            $request->name,

            'phone' =>
            $request->phone,

            'email' =>
            $request->email,

        ]);



        if ($user->profile) {


            $user->profile->update([


                'address'
                =>
                $request->address,


                'nik'
                =>
                $request->nik,


                'birth_date'
                =>
                $request->birth_date,


                'gender'
                =>
                $request->gender,


                'beneficiary_type'
                =>
                $request->beneficiary_type,


            ]);


        }



        return response()->json([

            'message'
            =>
            'Profile berhasil diperbarui',

            'user'
            =>
            $user->load('profile'),

        ]);

    }







    public function uploadPhoto(Request $request)
    {


        $request->validate([

            'photo'
            =>
            'required|image|max:2048',

        ]);



        $user = auth()->user();



        $path =
        $request->file('photo')
            ->store(
                'profile',
                'public'
            );




        if ($user->profile) {



            if (
                $user->profile->photo
                &&
                Storage::disk('public')
                ->exists(
                    $user->profile->photo
                )
            ) {

                Storage::disk('public')
                    ->delete(
                        $user->profile->photo
                    );

            }





            $user->profile->update([

                'photo'
                =>
                $path,

            ]);


        }




        return response()->json([

            'message'
            =>
            'Foto berhasil diperbarui',

            'photo'
            =>
            $path,

        ]);

    }


}
