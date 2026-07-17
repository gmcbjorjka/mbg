<?php

namespace App\Filament\Pages;

use App\Filament\Widgets\ReviewChart;
use App\Filament\Widgets\UserStats;
use Filament\Pages\Dashboard as BaseDashboard;

class Dashboard extends BaseDashboard
{
    protected static ?string $navigationIcon = 'heroicon-o-home';

    public function getHeaderWidgets(): array
    {
        return [
            UserStats::class,
        ];
    }

    public function getFooterWidgets(): array
    {
        return [
           
        ];
    }
}
