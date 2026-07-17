<?php

namespace App\Filament\Widgets;

use App\Models\User;
use App\Models\Schedule;
use App\Models\MbgMenu;
use App\Models\Distribution;
use App\Models\Confirmation;
use Filament\Widgets\StatsOverviewWidget as BaseWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;


class UserStats extends BaseWidget
{

    protected static ?int $sort = 1;



    protected function getStats(): array
    {

        return [



            Stat::make(
                'Total User',
                User::count()
            )

            ->description(
                'Semua pengguna sistem'
            )

            ->color('primary'),





            Stat::make(
                'Super Admin',
                User::where(
                    'role',
                    'super_admin'
                )->count()
            )

            ->description(
                'Pengelola sistem'
            )

            ->color('danger'),





            Stat::make(
                'Admin',
                User::where(
                    'role',
                    'admin'
                )->count()
            )

            ->description(
                'Petugas lapangan'
            )

            ->color('success'),





            Stat::make(
                'Penerima Manfaat',
                User::where(
                    'role',
                    'user'
                )->count()
            )

            ->description(
                'Penerima MBG'
            )

            ->color('warning'),





            Stat::make(
                'Jadwal MBG',
                Schedule::where(
                    'type',
                    'mbg'
                )->count()
            )

            ->description(
                'Total jadwal pembagian MBG'
            )

            ->color('info'),





            Stat::make(
                'Menu MBG',
                MbgMenu::count()
            )

            ->description(
                'Menu yang tersedia'
            )

            ->color('success'),





            Stat::make(
                'Distribusi MBG',
                Distribution::count()
            )

            ->description(
                'Data distribusi paket'
            )

            ->color('primary'),





            Stat::make(
                'Penerimaan MBG',
                Confirmation::where(
                    'status',
                    'diterima'
                )->count()
            )

            ->description(
                'Paket sudah diterima'
            )

            ->color('success'),





            Stat::make(
                'Rating Masuk',
                Confirmation::whereNotNull(
                    'rating'
                )->count()
            )

            ->description(
                'Feedback penerima'
            )

            ->color('warning'),



        ];

    }

}