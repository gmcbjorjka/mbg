<?php

namespace App\Services\Reports;

use App\Models\User;
use Carbon\Carbon;


class VerificationReport
{

    public function handle($filter)
    {


        /*
        |--------------------------------------------------------------------------
        | PERIODE SENIN - JUMAT
        |--------------------------------------------------------------------------
        */


        $start = Carbon::parse(

            $filter['start_date']

        )
        ->startOfWeek(
            Carbon::MONDAY
        );




        $days = [];



        for($i = 0; $i < 5; $i++){


            $date = $start->copy()->addDays($i);



            $days[] = [


                'key' => $date->format('Y-m-d'),


                'label' => $date->format('d/m/Y'),


            ];

        }







        /*
        |--------------------------------------------------------------------------
        | AMBIL USER AKTIF
        |--------------------------------------------------------------------------
        */


        $users = User::query()

            ->where(
                'role',
                'user'
            )

            ->where(
                'status',
                'active'
            )

            ->with([


                'profile',



                'confirmations'=>function($query) use($start){



                    $query->whereBetween(

                        'received_at',

                        [


                            $start->copy()

                                ->startOfDay(),



                            $start->copy()

                                ->addDays(4)

                                ->endOfDay(),


                        ]

                    );


                }


            ])

            ->orderBy(
                'name'
            )

            ->get();









        $data = [];






        foreach($users as $user){



            $profile = $user->profile;





            $row = [



                /*
                |--------------------------------------------------------------------------
                | JENIS PENERIMA
                |--------------------------------------------------------------------------
                */


                'jenis_penerima' =>


                    match(
                        $profile?->beneficiary_type
                    ){


                        'pregnant'

                            => 'Ibu Hamil',



                        'toddler_parent'

                            => 'Ibu Balita',



                        default

                            => '-',


                    },







                'nik_anak' =>


                    $profile?->child_nik

                    ??

                    '-',






                'nama_anak' =>


                    $profile?->child_name

                    ??

                    '-',






                'jenis_kelamin_anak' =>


                    match(
                        $profile?->child_gender
                    ){


                        'male'

                            => 'Laki-laki',



                        'female'

                            => 'Perempuan',



                        default

                            => '-',


                    },







                'tanggal_lahir_anak' =>


                    $profile?->child_birth_date

                    ?

                    Carbon::parse(

                        $profile->child_birth_date

                    )

                    ->format('d-m-Y')


                    :


                    '-',







                'nama_ortu' =>


                    $user->name,








                'alamat' =>


                    $profile?->address

                    ??

                    '-',



            ];









            /*
            |--------------------------------------------------------------------------
            | CEK PENERIMAAN PER TANGGAL
            |--------------------------------------------------------------------------
            */


            foreach($days as $day){



                $diterima = $user->confirmations

                    ->where(
                        'status',
                        'diterima'
                    )

                    ->filter(function($item) use($day){



                        if(
                            !$item->received_at
                        ){

                            return false;

                        }





                        return Carbon::parse(

                            $item->received_at

                        )

                        ->format('Y-m-d')

                        ===

                        $day['key'];



                    })

                    ->count();






                $row[

                    'tgl_'.$day['key']

                ] = $diterima > 0

                    ?

                    'OK'

                    :

                    '-';



            }








            $data[] = $row;


        }









        /*
        |--------------------------------------------------------------------------
        | KOLOM REPORT
        |--------------------------------------------------------------------------
        */


        $columns = [



            'jenis_penerima'

                => 'Jenis Penerima',



            'nik_anak'

                => 'NIK Anak',



            'nama_anak'

                => 'Nama Anak',



            'jenis_kelamin_anak'

                => 'Jenis Kelamin Anak',



            'tanggal_lahir_anak'

                => 'Tanggal Lahir Anak / HPHT',



            'nama_ortu'

                => 'Nama Orang Tua',



            'alamat'

                => 'Alamat',



        ];







        foreach($days as $day){



            $columns[

                'tgl_'.$day['key']

            ] = $day['label'];



        }








        return [



            'title' =>

                'Verifikasi Penerimaan MBG',




            'columns' =>

                $columns,




            'data' =>

                $data,




            'summary' => [],



        ];

    }

}