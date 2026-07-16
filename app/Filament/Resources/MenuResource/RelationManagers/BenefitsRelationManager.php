<?php

namespace App\Filament\Resources\MenuResource\RelationManagers;

use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\RelationManagers\RelationManager;
use Filament\Tables;
use Filament\Tables\Table;

class BenefitsRelationManager extends RelationManager
{
    protected static string $relationship = 'benefits';


    protected static ?string $title = 'Manfaat Menu';



    public function form(Form $form): Form
    {

        return $form
            ->schema([


                Forms\Components\Textarea::make('description')

                    ->label('Manfaat')

                    ->placeholder(
                        'Contoh: Ayam sebagai sumber protein untuk pertumbuhan'
                    )

                    ->required()

                    ->rows(3)

                    ->maxLength(500),




                Forms\Components\TextInput::make('sort')

                    ->label('Urutan Tampilan')

                    ->numeric()

                    ->default(0),


            ]);

    }







    public function table(Table $table): Table
    {

        return $table

            ->recordTitleAttribute('description')



            ->columns([




                Tables\Columns\TextColumn::make('description')

                    ->label('Manfaat')

                    ->wrap()

                    ->searchable(),





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

                    ->label('Tambah Manfaat'),


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
