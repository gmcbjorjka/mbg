<?php

namespace App\Filament\Resources\MenuResource\RelationManagers;

use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\RelationManagers\RelationManager;
use Filament\Tables;
use Filament\Tables\Table;

class ItemsRelationManager extends RelationManager
{
    protected static string $relationship = 'items';



    protected static ?string $title = 'Daftar Makanan';




    public function form(Form $form): Form
    {

        return $form
            ->schema([



                Forms\Components\TextInput::make('name')

                    ->label('Nama Makanan')

                    ->placeholder('Contoh: Ayam Kecap')

                    ->required()

                    ->maxLength(255),




                Forms\Components\Select::make('type')

                    ->label('Jenis Makanan')

                    ->options([

                        'karbohidrat' => '🍚 Karbohidrat',

                        'protein' => '🍗 Protein',

                        'sayuran' => '🥬 Sayuran',

                        'buah' => '🍊 Buah',

                        'minuman' => '🥛 Minuman',

                        'lainnya' => '🍽️ Lainnya',

                    ])

                    ->required()

                    ->searchable()

                    ->native(false),





                Forms\Components\TextInput::make('sort')

                    ->label('Urutan Tampilan')

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

                    ->label('Nama Makanan')

                    ->searchable()

                    ->sortable(),





                Tables\Columns\BadgeColumn::make('type')

                    ->label('Kategori')

                    ->formatStateUsing(function ($state) {

                        return match($state) {

                            'karbohidrat' => '🍚 Karbohidrat',

                            'protein' => '🍗 Protein',

                            'sayuran' => '🥬 Sayuran',

                            'buah' => '🍊 Buah',

                            'minuman' => '🥛 Minuman',

                            default => '🍽️ Lainnya',

                        };

                    })

                    ->colors([

                        'warning' => 'karbohidrat',

                        'danger' => 'protein',

                        'success' => 'sayuran',

                        'info' => 'buah',

                    ]),





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

                    ->label('Tambah Makanan'),

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
