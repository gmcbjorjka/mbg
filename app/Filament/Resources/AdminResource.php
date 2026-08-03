<?php

namespace App\Filament\Resources;

use App\Filament\Resources\AdminResource\Pages;
use App\Models\User;

use Filament\Forms;
use Filament\Forms\Form;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\Grid;
use Filament\Forms\Components\Section;

use Filament\Resources\Resource;

use Filament\Tables;
use Filament\Tables\Table;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;



class AdminResource extends Resource
{


    protected static ?string $model = User::class;




    protected static ?string $navigationIcon =
        'heroicon-o-user-group';




    protected static ?string $navigationLabel =
        'Manajemen Admin';




    protected static ?string $navigationGroup =
        'Sistem';







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
    | QUERY HANYA ADMIN
    |--------------------------------------------------------------------------
    */


    public static function getEloquentQuery(): Builder
    {

        return parent::getEloquentQuery()

            ->where(
                'role',
                'admin'
            );

    }









    public static function form(Form $form): Form
    {

        return $form

            ->schema([



                Section::make('Data Admin')


                    ->schema([



                        Grid::make(2)

                            ->schema([





                                TextInput::make('name')

                                    ->label('Nama Lengkap')

                                    ->required(),








                                TextInput::make('email')

                                    ->label('Email')

                                    ->email()

                                    ->required()

                                    ->unique(
                                        ignoreRecord:true
                                    ),









                                TextInput::make('phone')

                                    ->label('Nomor HP')

                                    ->tel()

                                    ->required()

                                    ->unique(
                                        ignoreRecord:true
                                    ),










                                Select::make('role')

                                    ->label('Role')

                                    ->options([

                                        'admin'
                                            =>
                                        'Admin',

                                    ])

                                    ->default('admin')

                                    ->disabled()

                                    ->dehydrated(),










                                Select::make('status')

                                    ->label('Status')

                                    ->options([


                                        'active'
                                            =>
                                        'Aktif',



                                        'inactive'
                                            =>
                                        'Non Aktif',


                                    ])

                                    ->default('active')

                                    ->required(),










                                TextInput::make('password')

                                    ->label('Password')

                                    ->password()

                                    ->required(
                                        fn(string $operation)=>
                                        $operation === 'create'
                                    )


                                    ->hidden(
                                        fn(string $operation)=>
                                        $operation === 'edit'
                                    )


                                    ->dehydrateStateUsing(
                                        fn($state)=>
                                        Hash::make($state)
                                    ),





                            ]),




                    ]),



            ]);

    }









    public static function table(Table $table): Table
    {

        return $table


            ->columns([





                Tables\Columns\TextColumn::make('name')

                    ->label('Nama Admin')

                    ->searchable(),








                Tables\Columns\TextColumn::make('email')

                    ->label('Email')

                    ->searchable(),








                Tables\Columns\TextColumn::make('phone')

                    ->label('Nomor HP'),









                Tables\Columns\TextColumn::make('status')

                    ->label('Status')

                    ->badge(),









                Tables\Columns\TextColumn::make('created_at')

                    ->label('Dibuat')

                    ->dateTime(
                        'd-m-Y H:i'
                    ),





            ])





            ->actions([


                Tables\Actions\EditAction::make(),


            ])





            ->bulkActions([



                Tables\Actions\BulkActionGroup::make([


                    Tables\Actions\DeleteBulkAction::make(),


                ]),


            ]);

    }









    public static function getRelations(): array
    {

        return [];

    }









    public static function getPages(): array
    {

        return [


            'index' =>

                Pages\ListAdmins::route('/'),





            'create' =>

                Pages\CreateAdmin::route('/create'),





            'edit' =>

                Pages\EditAdmin::route('/{record}/edit'),


        ];

    }


}