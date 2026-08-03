<?php

namespace App\Services\Reports;


use App\Models\User;



class MobileUserReport
{


    public function handle(array $filter): array
    {


        $query = User::query()

            ->with('profile')

            ->where('role','user');




        /*
        |--------------------------------------------------------------------------
        | FILTER TANGGAL
        |--------------------------------------------------------------------------
        */


        if(

            !($filter['all_data'] ?? false)

            &&

            !empty($filter['start_date'])

            &&

            !empty($filter['end_date'])

        ){

            $query->whereBetween(

                'created_at',

                [

                    $filter['start_date'],

                    $filter['end_date']

                ]

            );

        }






        $users = $query->get();







        /*
        |--------------------------------------------------------------------------
        | FORMAT DATA REPORT
        |--------------------------------------------------------------------------
        */


        $data = $users->map(function($user){



            $profile = $user->profile;




            return [



                'nama'=>

                    $user->name,




                'email'=>

                    $user->email ?? '-',





                'no_hp'=>

                    $user->phone ?? '-',





                'status'=>

                    match($user->status){

                        'active'=>'Aktif',

                        'inactive'=>'Tidak Aktif',

                        default=>'-'

                    },





                'tanggal_daftar'=>

                    optional($user->created_at)

                    ->format('d-m-Y'),






                'nik'=>

                    $profile->nik ?? '-',





                'alamat'=>

                    $profile->address ?? '-',






                'tanggal_lahir'=>

                    $profile?->birth_date

                    ?->format('d-m-Y') ?? '-',






                'jenis_kelamin'=>

                    match($profile?->gender){

                        'male'=>'Laki-laki',

                        'female'=>'Perempuan',

                        default=>'-'

                    },








                'jenis_penerima'=>

                    match($profile?->beneficiary_type){


                        'pregnant'=>

                            'Ibu Hamil',



                        'toddler_parent'=>

                            'Orang Tua Balita',



                        default=>

                            '-'

                    },







                'nama_anak'=>

                    $profile->child_name ?? '-',





                'nik_anak'=>

                    $profile->child_nik ?? '-',






                'jenis_kelamin_anak'=>

                    match($profile?->child_gender){


                        'male'=>

                            'Laki-laki',


                        'female'=>

                            'Perempuan',


                        default=>

                            '-'

                    },







                'tanggal_lahir_anak'=>

                    $profile?->child_birth_date

                    ?->format('d-m-Y') ?? '-',





            ];



        });







        /*
        |--------------------------------------------------------------------------
        | RETURN DINAMIS
        |--------------------------------------------------------------------------
        */


        return [



            'title'=>

                'User Mobile',






            'columns'=>[



                'nama'=>

                    'Nama',




                'email'=>

                    'Email',




                'no_hp'=>

                    'Nomor HP',




                'status'=>

                    'Status',




                'tanggal_daftar'=>

                    'Tanggal Daftar',




                'nik'=>

                    'NIK',




                'alamat'=>

                    'Alamat',




                'tanggal_lahir'=>

                    'Tanggal Lahir',




                'jenis_kelamin'=>

                    'Jenis Kelamin',




                'jenis_penerima'=>

                    'Jenis Penerima',




                'nama_anak'=>

                    'Nama Anak',




                'nik_anak'=>

                    'NIK Anak',




                'jenis_kelamin_anak'=>

                    'Jenis Kelamin Anak',




                'tanggal_lahir_anak'=>

                    'Tanggal Lahir Anak',



            ],







            'data'=>

                $data->toArray(),







            'summary'=>[



                'total'=>

                    $data->count(),






                'pregnant'=>

                    $data->where(

                        'jenis_penerima',

                        'Ibu Hamil'

                    )->count(),






                'toddler'=>

                    $data->where(

                        'jenis_penerima',

                        'Orang Tua Balita'

                    )->count(),



            ],




        ];



    }



}