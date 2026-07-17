<?php

namespace App\Filament\Widgets;

use App\Models\Schedule;
use App\Models\Distribution;
use App\Models\Confirmation;
use Filament\Widgets\ChartWidget;


class MbgStatisticChart extends ChartWidget
{

    protected static ?string $heading =
        'Perkembangan Statistik MBG';



    protected static ?int $sort = 2;



    protected int|string|array $columnSpan =
        'full';





    protected function getData(): array
    {


        $schedule = Schedule::where(
                'type',
                'mbg'
            )

            ->selectRaw(
                'DATE(date) as tanggal, COUNT(*) as total'
            )

            ->groupBy('tanggal')

            ->pluck(
                'total',
                'tanggal'
            );






        $distribution = Distribution::selectRaw(
                'DATE(created_at) as tanggal, COUNT(*) as total'
            )

            ->groupBy('tanggal')

            ->pluck(
                'total',
                'tanggal'
            );







        $confirmation = Confirmation::where(
                'status',
                'diterima'
            )

            ->selectRaw(
                'DATE(created_at) as tanggal, COUNT(*) as total'
            )

            ->groupBy('tanggal')

            ->pluck(
                'total',
                'tanggal'
            );







        $rating = Confirmation::whereNotNull(
                'rating'
            )

            ->selectRaw(
                'DATE(created_at) as tanggal, COUNT(*) as total'
            )

            ->groupBy('tanggal')

            ->pluck(
                'total',
                'tanggal'
            );







        $labels = collect()

            ->merge($schedule->keys())

            ->merge($distribution->keys())

            ->merge($confirmation->keys())

            ->merge($rating->keys())

            ->unique()

            ->sort()

            ->values();







        return [

            'datasets' => [



                [
                    'label' => 'Jadwal MBG',

                    'data' => $labels->map(
                        fn($date) =>
                            $schedule[$date] ?? 0
                    ),

                    'borderColor' => '#3b82f6',

                    'backgroundColor' => '#3b82f6',

                    'tension' => 0.4,

                ],




                [
                    'label' => 'Distribusi',

                    'data' => $labels->map(
                        fn($date) =>
                            $distribution[$date] ?? 0
                    ),

                    'borderColor' => '#22c55e',

                    'backgroundColor' => '#22c55e',

                    'tension' => 0.4,

                ],





                [
                    'label' => 'Penerimaan',

                    'data' => $labels->map(
                        fn($date) =>
                            $confirmation[$date] ?? 0
                    ),

                    'borderColor' => '#f59e0b',

                    'backgroundColor' => '#f59e0b',

                    'tension' => 0.4,

                ],





                [
                    'label' => 'Rating',

                    'data' => $labels->map(
                        fn($date) =>
                            $rating[$date] ?? 0
                    ),

                    'borderColor' => '#a855f7',

                    'backgroundColor' => '#a855f7',

                    'tension' => 0.4,

                ],


            ],



            'labels' => $labels,

        ];

    }






    protected function getType(): string
    {

        return 'line';

    }

}