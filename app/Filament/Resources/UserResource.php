<?php

namespace App\Filament\Resources;

use App\Filament\Resources\UserResource\Pages;
use App\Models\User;

use Filament\Forms\Form;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\Section;
use Filament\Forms\Components\Grid;
use Filament\Forms\Components\DatePicker;

use Filament\Resources\Resource;

use Filament\Tables;
use Filament\Tables\Table;

use Illuminate\Database\Eloquent\Builder;

use Filament\Infolists\Infolist;
use Filament\Infolists\Components\Section as InfoSection;
use Filament\Infolists\Components\Grid as InfoGrid;
use Filament\Infolists\Components\TextEntry;
use Filament\Infolists\Components\ImageEntry;



class UserResource extends Resource
{


    protected static ?string $model = User::class;



    protected static ?string $navigationIcon =
        'heroicon-o-users';



    protected static ?string $navigationLabel =
        'User Mobile';



    protected static ?string $navigationGroup =
        'Sistem';






    public static function getEloquentQuery(): Builder
    {

        return parent::getEloquentQuery()

            ->where('role','user')

            ->with('profile');

    }








    public static function canCreate(): bool
    {

        return false;

    }









    public static function form(Form $form): Form
{
    return $form
        ->schema([


            Section::make('Informasi User')

                ->schema([

                    Grid::make(2)

                        ->schema([


                            TextInput::make('name')

                                ->label('Nama Ibu')

                                ->required(),



                            TextInput::make('email')

                                ->label('Email')

                                ->disabled()
                                ->dehydrated(false),



                            TextInput::make('phone')

                                ->label('Nomor HP')

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

                                ->required(),

                        ]),


                ]),





            Section::make('Data Ibu')

                ->relationship('profile')

                ->schema([



                    TextInput::make('nik')

                        ->label('NIK Ibu')

                        ->disabled()
                        ->dehydrated(false),





                    Select::make('gender')

                        ->label('Jenis Kelamin Ibu')

                        ->options([

                            'female'
                                => 'Perempuan',

                        ])

                        ->default('female'),





                    DatePicker::make('birth_date')

                        ->label('Tanggal Lahir Ibu')

                        ->displayFormat('d-m-Y'),





                    Select::make('beneficiary_type')

                        ->label('Jenis Penerima')

                        ->options([


                            'pregnant'
                                => 'Ibu Hamil',



                            'toddler_parent'
                                => 'Ibu Balita',


                        ])

                        ->live()

                        ->afterStateUpdated(function(
                            $state,
                            callable $set
                        ){


                            if($state === 'pregnant'){


                                // hapus data anak

                                $set('child_name', null);

                                $set('child_nik', null);

                                $set('child_gender', null);


                            }


                        })

                        ->required(),






                    /*
                    |--------------------------------------------------------------------------
                    | TANGGAL DINAMIS
                    |--------------------------------------------------------------------------
                    */


                    DatePicker::make('child_birth_date')

                        ->label(fn($get) =>

                            $get('beneficiary_type')
                            ===
                            'pregnant'

                                ? 'HPHT / Awal Kehamilan'

                                : 'Tanggal Lahir Anak'

                        )

                        ->displayFormat('d-m-Y')

                        ->required(),








                    /*
                    |--------------------------------------------------------------------------
                    | DATA ANAK
                    |--------------------------------------------------------------------------
                    */


                    TextInput::make('child_name')

                        ->label('Nama Anak')

                        ->visible(fn($get)=>

                            $get('beneficiary_type')
                            ===
                            'toddler_parent'

                        ),






                    TextInput::make('child_nik')

                        ->label('NIK Anak')

                        ->visible(fn($get)=>

                            $get('beneficiary_type')
                            ===
                            'toddler_parent'

                        ),






                    Select::make('child_gender')

                        ->label('Jenis Kelamin Anak')

                        ->options([


                            'male'
                                => 'Laki-laki',


                            'female'
                                => 'Perempuan',


                        ])

                        ->visible(fn($get)=>

                            $get('beneficiary_type')
                            ===
                            'toddler_parent'

                        ),






                    TextInput::make('address')

                        ->label('Alamat Ibu')

                        ->columnSpanFull(),



                ])

                ->columns(2),



        ]);
}

        public static function table(Table $table): Table
    {

        return $table

            ->columns([





                Tables\Columns\TextColumn::make('name')

                    ->label('Nama Ibu')

                    ->searchable()

                    ->sortable(),







                Tables\Columns\TextColumn::make('phone')

                    ->label('Nomor HP')

                    ->searchable(),







                Tables\Columns\TextColumn::make('profile.beneficiary_type')

                    ->label('Jenis Penerima')

                    ->badge()

                    ->formatStateUsing(fn($state)=>match($state){



                        'pregnant'
                            => 'Ibu Hamil',




                        'toddler_parent'
                            => 'Ibu Balita',




                        default
                            => '-',



                    }),







                Tables\Columns\TextColumn::make('profile.child_name')

                    ->label('Nama Anak')

                    ->placeholder('-')

                    ->toggleable(),







                Tables\Columns\TextColumn::make('profile.age_information')

                    ->label('Usia Anak / Kandungan')

                    ->placeholder('-'),







                Tables\Columns\TextColumn::make('status')

                    ->label('Status')

                    ->badge()

                    ->color(fn($state)=>match($state){


                        'active'
                            => 'success',



                        'inactive'
                            => 'warning',



                        default
                            => 'gray',



                    }),







                Tables\Columns\TextColumn::make('created_at')

                    ->label('Tanggal Daftar')

                    ->dateTime('d-m-Y')

                    ->sortable(),




            ])





            ->filters([






                Tables\Filters\SelectFilter::make('status')

                    ->label('Status Akun')

                    ->options([



                        'active'
                            => 'Aktif',



                        'inactive'
                            => 'Menunggu Aktivasi',



                    ]),







                Tables\Filters\SelectFilter::make('profile.beneficiary_type')

                    ->label('Jenis Penerima')

                    ->options([



                        'pregnant'
                            => 'Ibu Hamil',




                        'toddler_parent'
                            => 'Ibu Balita',




                    ]),






            ])






            ->actions([



                Tables\Actions\ViewAction::make(),



                Tables\Actions\EditAction::make(),



            ]);

    }













    public static function getRelations(): array
    {

        return [];

    }









    public static function getPages(): array
    {

        return [



            'index'
                => Pages\ListUsers::route('/'),




            'edit'
                => Pages\EditUser::route('/{record}/edit'),




            'view'
                => Pages\ViewUser::route('/{record}'),




        ];

    }

        public static function infolist(Infolist $infolist): Infolist
    {

        return $infolist

            ->schema([





                /*
                |--------------------------------------------------------------------------
                | INFORMASI AKUN
                |--------------------------------------------------------------------------
                */


                InfoSection::make('Informasi Akun')

                    ->schema([



                        InfoGrid::make(2)

                            ->schema([




                                TextEntry::make('name')

                                    ->label('Nama Ibu'),





                                TextEntry::make('email')

                                    ->label('Email')

                                    ->placeholder('-'),





                                TextEntry::make('phone')

                                    ->label('Nomor HP')

                                    ->placeholder('-'),





                                TextEntry::make('status')

                                    ->label('Status Akun')

                                    ->badge(),





                            ]),



                    ]),













                /*
                |--------------------------------------------------------------------------
                | DATA IBU
                |--------------------------------------------------------------------------
                */


                InfoSection::make('Data Ibu')

                    ->schema([





                        ImageEntry::make('profile.photo')

                            ->label('Foto Ibu')

                            ->disk('public')

                            ->height(180)

                            ->circular()

                            ->visible(fn($record)=>

                                filled($record->profile?->photo)

                            ),







                        InfoGrid::make(2)

                            ->schema([






                                TextEntry::make('profile.nik')

                                    ->label('NIK Ibu')

                                    ->placeholder('-'),







                                TextEntry::make('profile.gender')

                                    ->label('Jenis Kelamin Ibu')

                                    ->formatStateUsing(fn($state)=>match($state){



                                        'male'
                                            => 'Laki-laki',



                                        'female'
                                            => 'Perempuan',



                                        default
                                            => '-',



                                    })

                                    ->placeholder('-'),







                                TextEntry::make('profile.birth_date')

                                    ->label('Tanggal Lahir Ibu')

                                    ->date('d-m-Y')

                                    ->placeholder('-'),







                                TextEntry::make('profile.beneficiary_type')

                                    ->label('Jenis Penerima')

                                    ->formatStateUsing(fn($state)=>match($state){



                                        'pregnant'
                                            => 'Ibu Hamil',




                                        'toddler_parent'
                                            => 'Ibu Balita',




                                        default
                                            => '-',



                                    }),







                                TextEntry::make('profile.address')

                                    ->label('Alamat Ibu')

                                    ->columnSpanFull()

                                    ->placeholder('-'),





                            ]),




                    ]),












                /*
                |--------------------------------------------------------------------------
                | DATA ANAK
                |--------------------------------------------------------------------------
                */


                InfoSection::make('Data Anak')

                    ->visible(fn($record)=>


                        $record?->profile?->beneficiary_type
                        ===
                        'toddler_parent'


                    )

                    ->schema([





                        InfoGrid::make(2)

                            ->schema([






                                TextEntry::make('profile.child_name')

                                    ->label('Nama Anak')

                                    ->placeholder('-'),








                                TextEntry::make('profile.child_nik')

                                    ->label('NIK Anak')

                                    ->placeholder('-'),








                                TextEntry::make('profile.child_gender')

                                    ->label('Jenis Kelamin Anak')

                                    ->formatStateUsing(fn($state)=>match($state){



                                        'male'
                                            => 'Laki-laki',



                                        'female'
                                            => 'Perempuan',



                                        default
                                            => '-',



                                    })

                                    ->placeholder('-'),







                                TextEntry::make('profile.child_birth_date')

                                    ->label('Tanggal Lahir Anak')

                                    ->date('d-m-Y')

                                    ->placeholder('-'),







                                TextEntry::make('profile.age_information')

                                    ->label('Usia Anak')

                                    ->placeholder('-'),






                            ]),




                    ]),













                /*
                |--------------------------------------------------------------------------
                | DATA KEHAMILAN
                |--------------------------------------------------------------------------
                */


                InfoSection::make('Data Kehamilan')

                    ->visible(fn($record)=>


                        $record?->profile?->beneficiary_type
                        ===
                        'pregnant'


                    )

                    ->schema([





                        InfoGrid::make(2)

                            ->schema([





                                TextEntry::make('profile.child_birth_date')

                                    ->label('HPHT / Awal Kehamilan')

                                    ->date('d-m-Y')

                                    ->placeholder('-'),






                                TextEntry::make('profile.age_information')

                                    ->label('Usia Kandungan')

                                    ->placeholder('-'),






                            ]),




                    ]),













                /*
                |--------------------------------------------------------------------------
                | INFORMASI SISTEM
                |--------------------------------------------------------------------------
                */


                InfoSection::make('Informasi Sistem')

                    ->collapsed()

                    ->schema([





                        InfoGrid::make(2)

                            ->schema([





                                TextEntry::make('created_at')

                                    ->label('Tanggal Daftar')

                                    ->dateTime('d-m-Y H:i'),






                                TextEntry::make('updated_at')

                                    ->label('Update Terakhir')

                                    ->dateTime('d-m-Y H:i'),





                            ]),





                    ]),





            ]);

    }


}