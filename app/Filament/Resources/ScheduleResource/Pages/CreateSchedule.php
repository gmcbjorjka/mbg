<?php

namespace App\Filament\Resources\ScheduleResource\Pages;

use App\Models\MbgMenu;
use App\Models\Distribution;
use App\Filament\Resources\ScheduleResource;
use Filament\Resources\Pages\CreateRecord;


class CreateSchedule extends CreateRecord
{

    protected static string $resource = ScheduleResource::class;



    protected static ?string $title = 'Buat Jadwal MBG';





    protected function afterCreate(): void
    {

        $schedule = $this->record;



        /*
        |--------------------------------------------------------------------------
        | Hanya Jadwal MBG yang membuat data otomatis
        |--------------------------------------------------------------------------
        */

        if ($schedule->type !== 'mbg') {

            return;

        }





        /*
        |--------------------------------------------------------------------------
        | Membuat Menu MBG otomatis
        |--------------------------------------------------------------------------
        */

        $menu = MbgMenu::create([

            'schedule_id' => $schedule->id,

            'date' => $schedule->date,

            'title' => 'Menu Hari Ini',

            'is_active' => true,

        ]);







        /*
        |--------------------------------------------------------------------------
        | Membuat Distribusi MBG otomatis
        |--------------------------------------------------------------------------
        */

        Distribution::create([

            'schedule_id' => $schedule->id,

            'menu_id' => $menu->id,

            'jumlah_dikirim' => 0,

            'keterangan' => null,

            'status' => 'persiapan',

        ]);

    }

}