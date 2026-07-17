<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Distribution;
use Carbon\Carbon;

class DistributionController extends Controller
{
    public function today()
    {


        $distribution = Distribution::with([
            'schedule',
            'menu'
        ])

        ->whereHas(
            'schedule',
            function ($query) {

                $query->whereDate(
                    'date',
                    Carbon::today()
                );

            }
        )

        ->first();





        if (!$distribution) {


            return response()->json([

                'success' => false,

                'message' => 'Belum ada distribusi MBG hari ini'


            ], 404);


        }







        return response()->json([


            'success' => true,


            'data' => [


                'id' => $distribution->id,


                'schedule_id' => $distribution->schedule_id,


                'menu_id' => $distribution->menu_id,


                'jumlah_dikirim' => $distribution->jumlah_dikirim,


                'keterangan' => $distribution->keterangan,


                'status' => $distribution->status,


                'schedule' => $distribution->schedule,


                'menu' => $distribution->menu,


            ]



        ]);



    }


}
