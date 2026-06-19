<?php

namespace App\Filament\Widgets;

use App\Models\Review;
use Filament\Widgets\ChartWidget;
use Illuminate\Support\Carbon;

class ReviewChart extends ChartWidget
{
    protected static ?int $sort = 2;
    protected static ?string $heading = 'Statistik Review MBG';
    protected int | string | array $columnSpan = 'full';
    protected function getData(): array
    {
        $data = Review::selectRaw('DATE(created_at) as date, COUNT(*) as total')
            ->groupBy('date')
            ->orderBy('date')
            ->pluck('total', 'date')
            ->toArray();

        return [
            'datasets' => [
                [
                    'label' => 'Review Masuk',
                    'data' => array_values($data),
                    'borderColor' => '#3b82f6',
                    'backgroundColor' => '#93c5fd',
                ],
            ],
            'labels' => array_keys($data),
        ];
    }

    protected function getType(): string
    {
        return 'line';
    }
}
