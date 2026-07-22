<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Schedule;
use App\Models\MbgMenu;
use App\Models\Distribution;
use App\Models\Article;
use Carbon\Carbon;

class DashboardController extends Controller
{
    /**
     * Dashboard User
     */
    public function index(Request $request)
    {

        $user = $request->user();



        /*
        |--------------------------------------------------------------------------
        | PROFILE USER
        |--------------------------------------------------------------------------
        */

        $profile = $user->profile;





        /*
        |--------------------------------------------------------------------------
        | STATISTIK PENERIMAAN
        |--------------------------------------------------------------------------
        */

        $confirmationCount = $user
            ->confirmations()
            ->where('status', 'diterima')
            ->count();







        /*
        |--------------------------------------------------------------------------
        | JUMLAH EDUKASI ARTIKEL
        |--------------------------------------------------------------------------
        */

        $educationCount = Article::where('status', 'published')
            ->count();








        /*
        |--------------------------------------------------------------------------
        | HITUNG USIA ANAK / KEHAMILAN
        |--------------------------------------------------------------------------
        */

        $childAge = null;

        $pregnancyAge = null;



        if ($profile) {



            // BALITA

            if (
                $profile->beneficiary_type === 'toddler_parent'
                &&
                $profile->child_birth_date
            ) {


                $childAge =
                    Carbon::parse(
                        $profile->child_birth_date
                    )
                    ->age;


            }






            // IBU HAMIL

            if (
                $profile->beneficiary_type === 'pregnant'
                &&
                $profile->child_birth_date
            ) {


                $weeks =

                    Carbon::parse(
                        $profile->child_birth_date
                    )
                    ->diffInWeeks(
                        now()
                    );



                $pregnancyAge = [


                    'weeks'
                        => $weeks,


                    'months'
                        => floor($weeks / 4.3),


                ];


            }



        }









        /*
        |--------------------------------------------------------------------------
        | RIWAYAT PENERIMAAN TERAKHIR
        |--------------------------------------------------------------------------
        */


        $latestConfirmations = $user
            ->confirmations()
            ->where('status', 'diterima')
            ->latest('received_at')
            ->limit(4)
            ->get()
            ->map(function ($item) {


                return [


                    'id'
                        => $item->id,


                    'date'
                        => $item->received_at
                        ? $item->received_at
                            ->format('d M Y')
                        : null,


                    'status'
                        => $item->status,


                    'rating'
                        => $item->rating,


                    'photo'
                        => $item->photo_url,



                ];


            });









        /*
        |--------------------------------------------------------------------------
        | JADWAL BERIKUTNYA
        |--------------------------------------------------------------------------
        */


        $nextSchedule = Schedule::where('is_active', true)

            ->whereDate(
                'date',
                '>=',
                now()
            )

            ->with([

                'menu',

                'distribution'

            ])

            ->orderBy('date')

            ->orderBy('start_time')

            ->first();









        /*
        |--------------------------------------------------------------------------
        | MENU HARI INI
        |--------------------------------------------------------------------------
        */


        $todayMenu = MbgMenu::whereDate(
            'date',
            today()
        )

            ->where('is_active', true)

            ->with([

                'items',

                'nutritions',

                'benefits'

            ])

            ->first();










        /*
        |--------------------------------------------------------------------------
        | DISTRIBUSI HARI INI
        |--------------------------------------------------------------------------
        */


        $todayDistribution = Distribution::whereHas(
            'schedule',
            function ($query) {


                $query->whereDate(
                    'date',
                    today()
                );


            }
        )

        ->with([

            'menu'

        ])

        ->first();










        /*
        |--------------------------------------------------------------------------
        | RESPONSE
        |--------------------------------------------------------------------------
        */


        return response()->json([


            'success' => true,


            'message' => 'Dashboard berhasil diambil',



            'data' => [





                'profile' => [



                    'name'
                        => $user->name,



                    'email'
                        => $user->email,



                    'beneficiary_type'
                        => $profile->beneficiary_type ?? null,



                    'child_name'
                        => $profile->child_name ?? null,



                    'child_birth_date'
                        => $profile->child_birth_date ?? null,



                    'photo'
                        => $profile->photo_url ?? null,



                ],








                'statistics' => [



                    'confirmation_count'
                        => $confirmationCount,



                    'child_age'
                        => $childAge,



                    'pregnancy_age'
                        => $pregnancyAge,



                    'education_count'
                        => $educationCount,



                ],









                'latest_confirmations'
                    => $latestConfirmations,









                'next_schedule'

                    => $nextSchedule

                    ? [



                        'id'
                            => $nextSchedule->id,



                        'title'
                            => $nextSchedule->title,



                        'date'
                            => $nextSchedule->date
                                ->format('d M Y'),



                        'start_time'
                            => $nextSchedule->start_time,



                        'end_time'
                            => $nextSchedule->end_time,



                        'location'
                            => $nextSchedule->location,



                        'address'
                            => $nextSchedule->address,



                        'image'
                            => $nextSchedule->image_url,



                    ]

                    : null,









                'today_menu'


                    => $todayMenu


                    ? [


                        'id'
                            => $todayMenu->id,


                        'title'
                            => $todayMenu->title,


                        'description'
                            => $todayMenu->description,


                        'image'
                            => $todayMenu->image,



                        'items'
                            => $todayMenu->items,



                        'nutrition'
                            => $todayMenu->nutritions,



                        'benefits'
                            => $todayMenu->benefits,



                    ]

                    : null,









                'today_distribution'


                    => $todayDistribution


                    ? [



                        'status'
                            => $todayDistribution->status,



                        'jumlah_dikirim'
                            => $todayDistribution->jumlah_dikirim,



                        'keterangan'
                            => $todayDistribution->keterangan,



                    ]


                    : null,





            ]



        ]);



    }


}
