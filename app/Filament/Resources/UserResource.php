<?php

namespace App\Filament\Resources;

use App\Filament\Resources\UserResource\Pages;
use App\Models\User;
use Filament\Forms\Form;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\Section;
use Filament\Forms\Components\Grid;
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



    /**
     * hanya user mobile
     */
    public static function getEloquentQuery(): Builder
    {
        return parent::getEloquentQuery()

            ->where('role', 'user')

            ->with('profile');
    }



    /**
     * user dibuat dari aplikasi mobile
     */
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

                                    ->label('Nama Lengkap')

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

                                        'active' => 'Aktif',

                                        'inactive' => 'Menunggu Aktivasi',

                                    ])

                                    ->required(),


                            ]),


                    ]),





                Section::make('Data Profile')

                    ->relationship('profile')

                    ->schema([



                        TextInput::make('nik')

                            ->label('NIK')

                            ->disabled(),




                        Select::make('gender')

                            ->label('Jenis Kelamin')

                            ->options([

                                'male' => 'Laki-laki',

                                'female' => 'Perempuan',

                            ]),




                        TextInput::make('birth_date')

                            ->label('Tanggal Lahir'),





                        Select::make('beneficiary_type')

                            ->label('Jenis Penerima')

                            ->options([

                                'pregnant' => 'Ibu Hamil',

                                'toddler_parent' => 'Orang Tua Balita',

                            ]),




                        TextInput::make('address')

                            ->label('Alamat')

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

                    ->label('Nama User')

                    ->searchable(),




                Tables\Columns\TextColumn::make('phone')

                    ->label('Nomor HP')

                    ->searchable(),





                Tables\Columns\TextColumn::make('profile.beneficiary_type')

                    ->label('Jenis Penerima')

                    ->formatStateUsing(fn ($state) => match($state) {

                        'pregnant' => 'Ibu Hamil',

                        'toddler_parent' => 'Orang Tua Balita',

                        default => '-',

                    }),




                Tables\Columns\TextColumn::make('status')

                    ->label('Status')

                    ->badge(),




                Tables\Columns\TextColumn::make('created_at')

                    ->label('Tanggal Daftar')

                    ->dateTime('d-m-Y'),


            ])



            ->filters([



                Tables\Filters\SelectFilter::make('status')

                    ->options([

                        'active' => 'Aktif',

                        'inactive' => 'Menunggu Aktivasi',

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



                InfoSection::make('Informasi Akun')

                    ->schema([


                        InfoGrid::make(2)

                            ->schema([



                                TextEntry::make('name')

                                    ->label('Nama Lengkap'),




                                TextEntry::make('email')

                                    ->label('Email'),




                                TextEntry::make('phone')

                                    ->label('Nomor HP'),




                                TextEntry::make('status')

                                    ->label('Status')

                                    ->badge(),


                            ]),


                    ]),






                InfoSection::make('Profile User')

                    ->schema([



                        ImageEntry::make('profile.photo')

                            ->label('Foto Profile')

                            ->disk('public')

                            ->height(200)

                            ->circular(),






                        InfoGrid::make(2)

                            ->schema([





                                TextEntry::make('profile.nik')

                                    ->label('NIK')

                                    ->placeholder('-'),






                                TextEntry::make('profile.gender')

                                    ->label('Jenis Kelamin')

                                    ->formatStateUsing(fn ($state) => match($state) {

                                        'male'
                                            => 'Laki-laki',

                                        'female'
                                            => 'Perempuan',

                                        default
                                        => '-',

                                    }),






                                TextEntry::make('profile.birth_date')

                                    ->label('Tanggal Lahir')

                                    ->date('d F Y')

                                    ->placeholder('-'),






                                TextEntry::make('profile.beneficiary_type')

                                    ->label('Jenis Penerima')

                                    ->formatStateUsing(fn ($state) => match($state) {

                                        'pregnant'
                                            => 'Ibu Hamil',

                                        'toddler_parent'
                                            => 'Orang Tua Balita',

                                        default
                                        => '-',

                                    }),






                                TextEntry::make('profile.address')

                                    ->label('Alamat')

                                    ->columnSpanFull()

                                    ->placeholder('-'),



                            ]),


                    ]),






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
