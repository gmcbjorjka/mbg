<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Schedule;
use App\Models\MbgMenu;
use App\Models\Distribution;

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
        | STATISTIK
        |--------------------------------------------------------------------------
        */

        $confirmationCount = $user
            ->confirmations()
            ->where('status', 'diterima')
            ->count();



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
                    'id' => $item->id,

                    'date' => $item->received_at
                        ? $item->received_at
                            ->format('d M Y')
                        : null,

                    'status' => $item->status,

                    'rating' => $item->rating,

                    'photo' => $item->photo_url,

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

                    'name' => $user->name,

                    'email' => $user->email,

                    'type' => $profile->type ?? null,

                    'photo' => $profile->photo_url ?? null,

                ],



                'statistics' => [

                    'confirmation_count'
                        => $confirmationCount,


                    'child_age'
                        => $profile->child_age ?? null,


                    'education_count'
                        => 0,

                ],



                'latest_confirmations'
                    => $latestConfirmations,



                'next_schedule' => $nextSchedule
                    ? [

                        'id' => $nextSchedule->id,

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



                'today_menu' => $todayMenu
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
                            => $todayDistribution
                                ->jumlah_dikirim,

                        'keterangan'
                            => $todayDistribution
                                ->keterangan,

                    ]
                    : null,


            ]

        ]);

    }
}
