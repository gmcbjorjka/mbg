<?php

namespace App\Filament\Widgets;

use App\Models\User;
use Filament\Widgets\StatsOverviewWidget as BaseWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;

class UserStats extends BaseWidget
{
    protected static ?int $sort = 1;
    protected function getStats(): array
    {
        return [
            Stat::make('Total User', User::count())
                ->description('Semua pengguna sistem')
                ->color('primary'),

            Stat::make('Admin', User::where('role', 'super_admin')->count())
                ->description('Pengelola sistem')
                ->color('danger'),

            Stat::make('Kader Posyandu', User::where('role', 'admin')->count())
                ->description('Petugas lapangan')
                ->color('success'),

            Stat::make('Penerima Manfaat', User::where('role', 'beneficiary')->count())
                ->description('Penerima MBG')
                ->color('warning'),
        ];
    }
}
