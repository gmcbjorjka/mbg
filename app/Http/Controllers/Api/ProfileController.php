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


            /*
            |--------------------------------------------------------------------------
            | USER
            |--------------------------------------------------------------------------
            */


            'name' =>

                'required|string|max:255',



            'phone' =>

                'nullable|string|max:20',



            'email' =>

                'required|email',






            /*
            |--------------------------------------------------------------------------
            | PROFILE IBU
            |--------------------------------------------------------------------------
            */


            'address' =>

                'nullable|string',



            'nik' =>

                'nullable|string|max:20',



            'birth_date' =>

                'nullable|date',



            'gender' =>

                'nullable|in:male,female',



            'beneficiary_type' =>

                'nullable|in:pregnant,toddler_parent',






            /*
            |--------------------------------------------------------------------------
            | DATA ANAK
            |--------------------------------------------------------------------------
            */


            'child_name' =>

                'nullable|string|max:255',



            'child_nik' =>

                'nullable|string|max:20',



            'child_gender' =>

                'nullable|in:male,female',



            'child_birth_date' =>

                'nullable|date',



        ]);








        /*
        |--------------------------------------------------------------------------
        | UPDATE USER
        |--------------------------------------------------------------------------
        */


        $user->update([


            'name' =>

                $request->name,



            'phone' =>

                $request->phone,



            'email' =>

                $request->email,



        ]);










        /*
        |--------------------------------------------------------------------------
        | UPDATE PROFILE
        |--------------------------------------------------------------------------
        */


        if($user->profile){


            $user->profile->update([



                'address' =>

                    $request->address,



                'nik' =>

                    $request->nik,



                'birth_date' =>

                    $request->birth_date,



                'gender' =>

                    $request->gender,



                'beneficiary_type' =>

                    $request->beneficiary_type,






                /*
                | Data Anak
                */


                'child_name' =>

                    $request->child_name,



                'child_nik' =>

                    $request->child_nik,



                'child_gender' =>

                    $request->child_gender,



                'child_birth_date' =>

                    $request->child_birth_date,




            ]);

        }







        return response()->json([


            'message' =>

                'Profile berhasil diperbarui',



            'user' =>

                $user->load('profile'),



        ]);

    }












    public function uploadPhoto(Request $request)
    {



        $request->validate([


            'photo' =>

                'required|image|max:2048',



        ]);







        $user = auth()->user();






        $path =

            $request

            ->file('photo')

            ->store(

                'profile',

                'public'

            );









        if($user->profile){





            if(

                $user->profile->photo

                &&

                Storage::disk('public')

                ->exists(

                    $user->profile->photo

                )

            ){


                Storage::disk('public')

                    ->delete(

                        $user->profile->photo

                    );


            }







            $user->profile->update([



                'photo' =>

                    $path,



            ]);



        }








        return response()->json([


            'message' =>

                'Foto berhasil diperbarui',



            'photo' =>

                $path,



        ]);

    }


}