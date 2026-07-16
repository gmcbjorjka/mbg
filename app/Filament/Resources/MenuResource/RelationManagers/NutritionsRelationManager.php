<?php

namespace App\Filament\Resources\MenuResource\RelationManagers;

use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\RelationManagers\RelationManager;
use Filament\Tables;
use Filament\Tables\Table;

class NutritionsRelationManager extends RelationManager
{
    protected static string $relationship = 'nutritions';


    protected static ?string $title = 'Informasi Gizi';



    public function form(Form $form): Form
    {

        return $form
            ->schema([



                Forms\Components\TextInput::make('name')

                    ->label('Nama Gizi')

                    ->placeholder('Contoh: Kalori')

                    ->required()

                    ->maxLength(255),





                Forms\Components\TextInput::make('value')

                    ->label('Nilai Gizi')

                    ->placeholder('Contoh: 550 kkal')

                    ->required(),





                Forms\Components\Select::make('type')

                    ->label('Jenis Gizi')

                    ->options([


                        'kalori' => 'Kalori',

                        'protein' => 'Protein',

                        'karbohidrat' => 'Karbohidrat',

                        'lemak' => 'Lemak',

                        'vitamin' => 'Vitamin',

                        'mineral' => 'Mineral',


                    ])

                    ->required()

                    ->native(false),





                Forms\Components\TextInput::make('sort')

                    ->label('Urutan')

                    ->numeric()

                    ->default(0),


            ]);

    }







    public function table(Table $table): Table
    {

        return $table

            ->recordTitleAttribute('name')



            ->columns([




                Tables\Columns\TextColumn::make('name')

                    ->label('Nutrisi')

                    ->searchable(),





                Tables\Columns\TextColumn::make('value')

                    ->label('Nilai')

                    ->badge(),






                Tables\Columns\TextColumn::make('type')

                    ->label('Jenis')

                    ->formatStateUsing(function ($state) {


                        return match($state) {


                            'kalori'
                                => '🔥 Kalori',


                            'protein'
                                => '💪 Protein',


                            'karbohidrat'
                                => '🌾 Karbohidrat',


                            'lemak'
                                => '🧈 Lemak',


                            'vitamin'
                                => '🍊 Vitamin',


                            'mineral'
                                => '🦴 Mineral',


                            default
                            => 'Gizi',

                        };


                    })

                    ->badge()

                    ->color(function ($state) {


                        return match($state) {


                            'protein'
                                => 'danger',


                            'karbohidrat'
                                => 'warning',


                            'vitamin'
                                => 'success',


                            'kalori'
                                => 'info',


                            default
                            => 'gray',

                        };


                    }),





                Tables\Columns\TextColumn::make('sort')

                    ->label('Urutan')

                    ->sortable(),



            ])




            ->defaultSort(
                'sort',
                'asc'
            )



            ->headerActions([


                Tables\Actions\CreateAction::make()

                    ->label('Tambah Gizi'),


            ])




            ->actions([


                Tables\Actions\EditAction::make(),


                Tables\Actions\DeleteAction::make(),


            ])




            ->bulkActions([


                Tables\Actions\BulkActionGroup::make([

                    Tables\Actions\DeleteBulkAction::make(),

                ]),


            ]);

    }

}
