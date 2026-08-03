<?php

namespace App\Filament\Pages;

use App\Models\Sppg;

use Filament\Forms;
use Filament\Forms\Form;
use Filament\Pages\Page;
use Filament\Notifications\Notification;

use Illuminate\Support\Facades\Auth;



class SppgSetting extends Page
{


    protected static string $view =
        'filament.pages.sppg-setting';



    protected static ?string $navigationIcon =
        'heroicon-o-building-office';



    protected static ?string $navigationLabel =
        'Pengaturan SPPG';



    protected static ?string $navigationGroup =
        'Sistem';



    protected static ?int $navigationSort =
        5;





    public ?array $data = [];







    /*
    |--------------------------------------------------------------------------
    | HANYA SUPER ADMIN
    |--------------------------------------------------------------------------
    */


    public static function canAccess(): bool
    {

        return Auth::user()?->role === 'super_admin';

    }









    /*
    |--------------------------------------------------------------------------
    | LOAD DATA
    |--------------------------------------------------------------------------
    */


    public function mount(): void
    {


        $sppg = Sppg::first();



        $this->form->fill([


            'name' =>

                $sppg?->name,



            'address' =>

                $sppg?->address,



            'posyandu_name' =>

                $sppg?->posyandu_name,



        ]);


    }









    /*
    |--------------------------------------------------------------------------
    | FORM
    |--------------------------------------------------------------------------
    */


    public function form(Form $form): Form
    {


        return $form


            ->schema([



                Forms\Components\Section::make(
                    'Informasi SPPG'
                )


                ->description(
                    'Data ini digunakan untuk kop surat dan laporan.'
                )



                ->schema([





                    Forms\Components\TextInput::make('name')


                        ->label('Nama SPPG')


                        ->placeholder(
                            'Contoh: SPPG Kecamatan ABC'
                        )


                        ->required(),







                    Forms\Components\Textarea::make('address')


                        ->label('Alamat SPPG')


                        ->rows(3)


                        ->placeholder(
                            'Alamat lengkap SPPG'
                        )


                        ->required(),








                    Forms\Components\TextInput::make(
                        'posyandu_name'
                    )


                        ->label('Nama Posyandu')


                        ->placeholder(
                            'Contoh: Posyandu Melati'
                        )


                        ->required(),






                ])




            ])



            ->statePath('data');


    }









    /*
    |--------------------------------------------------------------------------
    | SIMPAN
    |--------------------------------------------------------------------------
    */


    public function save(): void
    {



        Sppg::updateOrCreate(


            [

                'id'=>1

            ],



            $this->data



        );







        Notification::make()


            ->title(
                'Data SPPG berhasil disimpan'
            )


            ->success()


            ->send();



    }



}