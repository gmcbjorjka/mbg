<?php

namespace App\Services\Reports;


use App\Models\Schedule;



class ScheduleReport
{


    public function handle($filter)
    {


        $query = Schedule::query()

            ->orderBy(
                'date',
                'desc'
            );





        if(
            !($filter['all_data'] ?? false)
        ){

            $query->whereBetween(

                'date',

                [

                    $filter['start_date'],

                    $filter['end_date']

                ]

            );

        }





        $schedules = $query->get();






        $data = $schedules->map(function($schedule){



            return [



                'tanggal'=>

                    optional(
                        $schedule->date
                    )

                    ->format('d-m-Y'),





                'jenis'=>

                    match($schedule->type){


                        'distribution'
                            =>
                            'Distribusi',


                        'event'
                            =>
                            'Kegiatan',


                        default
                            =>
                            ucfirst(
                                $schedule->type
                            )


                    },





                'judul'=>

                    $schedule->title ?? '-',






                'waktu'=>

                    ($schedule->start_time ?? '-')

                    .

                    ' - '

                    .

                    ($schedule->end_time ?? '-'),






                'lokasi'=>

                    $schedule->location ?? '-',






                'alamat'=>

                    $schedule->address ?? '-',






                'status'=>

                    match($schedule->status){


                        'selesai'
                            =>
                            'Selesai',


                        'akan_datang'
                            =>
                            'Akan Datang',


                        default
                            =>
                            '-'

                    },



            ];



        });








        return [



            'title'=>

                'Jadwal',





            'columns'=>[



                'tanggal'=>

                    'Tanggal',




                'jenis'=>

                    'Jenis Kegiatan',




                'judul'=>

                    'Judul',




                'waktu'=>

                    'Waktu',




                'lokasi'=>

                    'Lokasi',




                'alamat'=>

                    'Alamat',




                'status'=>

                    'Status',



            ],





            'data'=>

                $data->toArray(),






            'summary'=>[



                'total'=>

                    $data->count(),




                'akan_datang'=>

                    $data->where(

                        'status',

                        'Akan Datang'

                    )->count(),





                'selesai'=>

                    $data->where(

                        'status',

                        'Selesai'

                    )->count(),



            ],




        ];



    }


}