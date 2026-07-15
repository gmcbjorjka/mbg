<?php

namespace App\Filament\Resources;

use App\Filament\Resources\UserResource\Pages;
use App\Models\User;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\Section;
use Filament\Forms\Components\Grid;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Facades\Hash;

class UserResource extends Resource
{
    protected static ?string $model = User::class;


    protected static ?string $navigationIcon =
        'heroicon-o-user-group';


    protected static ?string $navigationLabel =
        'Manajemen User';


    protected static ?string $navigationGroup =
        'Sistem';



    /**
     * LOAD PROFILE
     */
    public static function getEloquentQuery(): Builder
    {
        return parent::getEloquentQuery()
            ->with('profile');
    }




    public static function form(Form $form): Form
    {

        return $form
            ->schema([



                // =====================
                // DATA USER
                // =====================

                Section::make('Informasi Akun')
                    ->description('Data akun pengguna mobile')

                    ->schema([


                        Grid::make(2)
                            ->schema([



                                TextInput::make('name')

                                    ->label('Nama Lengkap')

                                    ->required()

                                    ->maxLength(255),





                                TextInput::make('email')

                                    ->label('Email')

                                    ->disabled()

                                    ->dehydrated(false),





                                TextInput::make('phone')

                                    ->label('Nomor HP')

                                    ->disabled()

                                    ->dehydrated(false),





                                Select::make('role')

                                    ->label('Role')

                                    ->options([

                                        'super_admin'
                                            => 'Super Admin',

                                        'admin'
                                            => 'Admin',

                                        'user'
                                            => 'User',

                                    ])

                                    ->disabled()

                                    ->dehydrated(false),





                                Select::make('status')

                                    ->label('Status Akun')

                                    ->options([

                                        'active'
                                            => 'Aktif',


                                        'inactive'
                                            => 'Menunggu Aktivasi',

                                    ])

                                    ->required()

                                    ->native(false),





                                TextInput::make('password')

                                    ->label('Password')

                                    ->password()

                                    ->required(
                                        fn (string $operation) =>
                                        $operation === 'create'
                                    )

                                    ->hidden(
                                        fn (string $operation) =>
                                        $operation === 'edit'
                                    )

                                    ->minLength(8)

                                    ->dehydrateStateUsing(
                                        fn ($state) =>
                                        Hash::make($state)
                                    ),

                            ]),


                    ]),




                // =====================
                // PROFILE RELATION
                // =====================


                Section::make('Data Profile')

                    ->description(
                        'Informasi tambahan pengguna'
                    )

                    ->relationship('profile')

                    ->schema([



                        TextInput::make('address')

                            ->label('Alamat')

                            ->required(false)

                            ->columnSpanFull(),




                        Select::make('beneficiary_type')

                            ->label('Jenis Penerima')

                            ->options([


                                'pregnant'
                                    => 'Ibu Hamil',


                                'toddler_parent'
                                    => 'Orang Tua Balita',

                            ])

                            ->disabled(),



                    ])

                    ->columns(2),



            ]);
    }

    public static function table(Table $table): Table
    {
        return $table


            ->modifyQueryUsing(function (Builder $query) {


                $query

                    ->where('id', '!=', auth()->id())

                    ->where('role', '!=', 'super_admin');


            })


            ->columns([



                Tables\Columns\TextColumn::make('name')

                    ->label('Nama Lengkap')

                    ->searchable(),





                Tables\Columns\TextColumn::make('phone')

                    ->label('Nomor HP')

                    ->searchable(),





                Tables\Columns\TextColumn::make('email')

                    ->label('Email')

                    ->searchable(),





                Tables\Columns\TextColumn::make('role')

                    ->label('Role')

                    ->badge()

                    ->color(fn ($state) => match ($state) {

                        'admin' => 'warning',

                        'user' => 'info',

                        default => 'gray',

                    }),





                Tables\Columns\TextColumn::make('status')

                    ->label('Status')

                    ->badge()

                    ->color(fn ($state) => match ($state) {

                        'active' => 'success',

                        'inactive' => 'warning',

                        default => 'gray',

                    }),





                Tables\Columns\TextColumn::make(
                    'profile.beneficiary_type'
                )

                    ->label('Jenis Penerima')

                    ->formatStateUsing(function ($state) {


                        return match ($state) {


                            'pregnant'
                                => 'Ibu Hamil',


                            'toddler_parent'
                                => 'Orang Tua Balita',


                            default
                            => '-',

                        };


                    }),




                Tables\Columns\TextColumn::make(
                    'profile.address'
                )

                    ->label('Alamat')

                    ->limit(30),



            ])




            ->filters([

                Tables\Filters\SelectFilter::make('status')

                    ->options([

                        'active' => 'Aktif',

                        'inactive' => 'Menunggu Aktivasi',

                    ]),


                Tables\Filters\SelectFilter::make('role')

                    ->options([

                        'admin' => 'Admin',

                        'user' => 'User',

                    ]),

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
        return [

            //

        ];
    }





    public static function getPages(): array
    {

        return [


            'index'
                => Pages\ListUsers::route('/'),



            'create'
                => Pages\CreateUser::route('/create'),



            'edit'
                => Pages\EditUser::route('/{record}/edit'),


        ];

    }

}
