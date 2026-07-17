<?php

namespace App\Filament\Resources;

use App\Filament\Resources\MenuRatingResource\Pages;
use App\Models\Confirmation;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Filament\Forms;
use Illuminate\Database\Eloquent\Builder;


class MenuRatingResource extends Resource
{

    protected static ?string $model = Confirmation::class;


    protected static ?string $navigationIcon =
        'heroicon-o-star';


    protected static ?string $navigationLabel =
        'Rating Menu MBG';


    protected static ?string $navigationGroup =
        'Feedback';


    protected static ?int $navigationSort = 1;



    protected static ?string $modelLabel =
        'Rating Menu MBG';


    protected static ?string $pluralModelLabel =
        'Daftar Rating Menu MBG';





    public static function table(Table $table): Table
    {

        return $table

            ->columns([


                Tables\Columns\TextColumn::make('user.name')

                    ->label('Penerima')

                    ->searchable(),




                Tables\Columns\TextColumn::make('distribution.schedule.date')

                    ->label('Tanggal MBG')

                    ->date('d M Y')

                    ->sortable(),





                Tables\Columns\TextColumn::make('distribution.menu.title')

                    ->label('Menu MBG')

                    ->limit(30),





                Tables\Columns\TextColumn::make('rating')

                    ->label('Rating')

                    ->formatStateUsing(function ($state) {

                        if (!$state) {
                            return '-';
                        }


                        return str_repeat(
                            '⭐',
                            $state
                        );

                    }),





                Tables\Columns\TextColumn::make('kritik')

                    ->label('Kritik & Saran')

                    ->wrap()

                    ->limit(50),





                Tables\Columns\TextColumn::make('created_at')

                    ->label('Tanggal Input')

                    ->dateTime('d M Y H:i'),


            ])





            ->filters([


                Tables\Filters\Filter::make('tanggal')

                    ->label('Tanggal Jadwal MBG')

                    ->form([

                        Forms\Components\DatePicker::make('date')

                            ->label('Tanggal'),

                    ])



                    ->query(function (
                        Builder $query,
                        array $data
                    ) {


                        return $query->when(

                            $data['date'] ?? null,

                            function (
                                Builder $query,
                                $date
                            ) {


                                $query->whereHas(

                                    'distribution.schedule',

                                    function ($schedule) use ($date) {


                                        $schedule->whereDate(

                                            'date',

                                            $date

                                        );


                                    }

                                );


                            }

                        );


                    }),


            ])




            ->actions([])


            ->bulkActions([]);


    }





    public static function getPages(): array
    {

        return [

            'index' =>
                Pages\ListMenuRatings::route('/'),

        ];

    }


}