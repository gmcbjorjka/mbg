<?php

namespace App\Filament\Resources;

use App\Filament\Resources\BeneficiaryResource\Pages;
use App\Models\User;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;


class BeneficiaryResource extends Resource
{

    protected static ?string $model = User::class;



    protected static ?string $navigationIcon =
        'heroicon-o-users';



    protected static ?string $navigationLabel =
        'Penerima Manfaat';



    protected static ?string $navigationGroup =
        'Data Master';



    protected static ?int $navigationSort = 3;

      protected static ?string $modelLabel = 'Penerima Manfaat';

protected static ?string $pluralModelLabel = 'Daftar Penerima Manfaat';





    /**
     * Ambil hanya user dengan role user
     */
    public static function getEloquentQuery(): Builder
    {

        return parent::getEloquentQuery()

            ->where('role', 'user');

    }







    public static function table(Table $table): Table
    {

        return $table

            ->columns([



                Tables\Columns\TextColumn::make('name')

                    ->label('Nama Penerima')

                    ->searchable()

                    ->sortable(),





                Tables\Columns\TextColumn::make('email')

                    ->label('Email')

                    ->searchable(),





                Tables\Columns\TextColumn::make('phone')

                    ->label('Nomor HP')

                    ->default('-'),





                Tables\Columns\BadgeColumn::make('role')

                    ->label('Status')

                    ->formatStateUsing(function () {

                        return 'Penerima MBG';

                    })

                    ->color('success'),





                Tables\Columns\TextColumn::make('created_at')

                    ->label('Tanggal Registrasi')

                    ->date('d M Y')

                    ->sortable(),


            ])





            ->filters([

                //

            ])





            ->actions([

                // hanya lihat data

            ])





            ->bulkActions([

                // tidak ada hapus

            ]);

    }









    public static function getRelations(): array
    {

        return [];

    }









    public static function getPages(): array
    {

        return [

            'index' => Pages\ListBeneficiaries::route('/'),

        ];

    }

}