<?php

namespace App\Filament\Resources;

use App\Filament\Resources\DistributionResource\Pages;
use App\Models\Distribution;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;


class DistributionResource extends Resource
{

    protected static ?string $model = Distribution::class;



    protected static ?string $navigationIcon =
        'heroicon-o-truck';



    protected static ?string $navigationLabel =
        'Distribusi MBG';



    protected static ?string $navigationGroup =
        'Operasional';



    protected static ?int $navigationSort = 3;


 protected static ?string $modelLabel = 'Distribusi MBG';

protected static ?string $pluralModelLabel = 'Daftar Distribusi MBG';



    public static function form(Form $form): Form
    {

        return $form

            ->schema([


                Forms\Components\TextInput::make('jumlah_dikirim')

                    ->label('Jumlah Paket Dikirim')

                    ->numeric()

                    ->required(),




                Forms\Components\Textarea::make('keterangan')

                    ->label('Keterangan Distribusi')

                    ->rows(3)

                    ->nullable(),




                Forms\Components\Select::make('status')

                    ->label('Status Distribusi')

                    ->options([

                        'persiapan' => 'Persiapan',

                        'dikirim' => 'Dikirim',

                        'selesai' => 'Selesai',

                    ])

                    ->native(false)

                    ->required(),


            ]);

    }









    public static function table(Table $table): Table
    {

        return $table

            ->columns([



                Tables\Columns\TextColumn::make('schedule.date')

                    ->label('Tanggal')

                    ->date('d M Y')

                    ->sortable(),





                Tables\Columns\TextColumn::make('schedule.title')

                    ->label('Jadwal MBG')

                    ->searchable()

                    ->limit(30),





                Tables\Columns\TextColumn::make('menu.title')

                    ->label('Menu')

                    ->limit(30),





                Tables\Columns\TextColumn::make('jumlah_dikirim')

                    ->label('Jumlah Dikirim')

                    ->suffix(' Paket')

                    ->sortable(),


                    Tables\Columns\TextColumn::make('confirmations_count')

    ->label('Jumlah Diterima')

    ->counts('confirmations')

    ->suffix(' Paket')

    ->sortable(),




                Tables\Columns\BadgeColumn::make('status')

                    ->label('Status')

                    ->colors([

                        'warning' => 'persiapan',

                        'info' => 'dikirim',

                        'success' => 'selesai',

                    ]),





                Tables\Columns\TextColumn::make('keterangan')

                    ->label('Keterangan')

                    ->limit(40),



            ])





            ->actions([


                Tables\Actions\EditAction::make()

                    ->label('Edit Distribusi'),



            ])





            ->filters([



                Tables\Filters\SelectFilter::make('status')

                    ->label('Status')

                    ->options([

                        'persiapan' => 'Persiapan',

                        'dikirim' => 'Dikirim',

                        'selesai' => 'Selesai',

                    ]),



            ])





            ->bulkActions([]);


    }









    public static function getRelations(): array
    {

        return [

            //

        ];

    }









    public static function getPages(): array
    {

        return [

            'index' => Pages\ListDistributions::route('/'),

            'edit' => Pages\EditDistribution::route('/{record}/edit'),

        ];

    }

}