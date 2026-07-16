<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Schedule;
use Illuminate\Http\Request;
use Carbon\Carbon;

class ScheduleController extends Controller
{
    public function index(Request $request)
    {


        $query = Schedule::where(
            'is_active',
            true
        );



        // FILTER TYPE
        // mbg / posyandu

        if ($request->type) {

            $query->where(
                'type',
                $request->type
            );

        }





        // FILTER BULAN

        if ($request->month) {

            $query->whereMonth(
                'date',
                $request->month
            );

        }





        // FILTER TAHUN

        if ($request->year) {

            $query->whereYear(
                'date',
                $request->year
            );

        }





        $data = $query

            ->orderBy(
                'date',
                'asc'
            )

            ->get();







        return response()->json([


            'success' => true,


            'data' => $data->map(function ($item) {



                return $this->formatData($item);



            })



        ]);

    }








    public function show($id)
    {


        $schedule = Schedule::find($id);



        if (!$schedule) {


            return response()->json([

                'success' => false,

                'message' => 'Jadwal tidak ditemukan'

            ], 404);


        }





        return response()->json([


            'success' => true,


            'data' => $this->formatData($schedule)



        ]);



    }








    private function formatData($item)
    {


        return [


            'id' => $item->id,


            'type' => $item->type,



            'kategori' =>

                $item->type == "mbg"

                ?

                "Pembagian MBG"

                :

                "Posyandu",




            'date' =>

                Carbon::parse($item->date)
                ->format('Y-m-d'),




            'title' => $item->title,




            'start_time' => $item->start_time,



            'end_time' => $item->end_time,



            'location' => $item->location,



            'address' => $item->address,




            'image' =>

                $item->image

                ?

                asset(
                    'storage/'.$item->image
                )

                :

                null,




            'description' => $item->description,




            'status' =>

                Carbon::parse($item->date)
                ->startOfDay()
                ->isPast()

                ?

                'selesai'

                :

                'akan_datang',



        ];


    }




}
