<?php

namespace App\Filament\Resources;

use App\Filament\Resources\ScheduleResource\Pages;
use App\Models\Schedule;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;

class ScheduleResource extends Resource
{
    protected static ?string $model = Schedule::class;



    protected static ?string $navigationIcon =
        'heroicon-o-calendar-days';



    protected static ?string $navigationLabel =
        'Jadwal MBG & Posyandu';



    protected static ?string $navigationGroup =
        'Operasional';





    public static function form(Form $form): Form
    {

        return $form

            ->schema([



                Forms\Components\Select::make('type')

                    ->label('Jenis Jadwal')

                    ->options([

                        'mbg' => 'Pembagian MBG',

                        'posyandu' => 'Posyandu',

                    ])

                    ->required()

                    ->native(false),





                Forms\Components\DatePicker::make('date')

                    ->label('Tanggal Kegiatan')

                    ->required(),





                Forms\Components\TextInput::make('title')

                    ->label('Judul Jadwal')

                    ->placeholder(
                        'Contoh: Posyandu Bulan Juli'
                    )

                    ->required()

                    ->maxLength(255),






                Forms\Components\TimePicker::make('start_time')

                    ->label('Jam Mulai')

                    ->seconds(false)

                    ->required(),






                Forms\Components\TimePicker::make('end_time')

                    ->label('Jam Selesai')

                    ->seconds(false)

                    ->required(),






                Forms\Components\TextInput::make('location')

                    ->label('Lokasi')

                    ->placeholder(
                        'Contoh: Posyandu Melati'
                    )

                    ->required(),





                Forms\Components\Textarea::make('address')

                    ->label('Alamat Lengkap')

                    ->rows(3)

                    ->required()

                    ->columnSpanFull(),





                Forms\Components\FileUpload::make('image')

                    ->label('Foto Kegiatan')

                    ->image()

                    ->directory('schedules')

                    ->imageEditor()

                    ->nullable(),





                Forms\Components\Textarea::make('description')

                    ->label('Keterangan')

                    ->placeholder(
                        'Tambahkan informasi kegiatan'
                    )

                    ->rows(4)

                    ->columnSpanFull()

                    ->nullable(),






                Forms\Components\Toggle::make('is_active')

                    ->label('Aktif')

                    ->default(true)

                    ->onColor('success')

                    ->offColor('danger'),




            ]);

    }









    public static function table(Table $table): Table
    {


        return $table

            ->columns([





                Tables\Columns\ImageColumn::make('image')

                    ->label('Foto')

                    ->circular(),






                Tables\Columns\BadgeColumn::make('type')

                    ->label('Jenis')

                    ->formatStateUsing(function ($state) {


                        return $state === 'mbg'

                            ?

                            'MBG'

                            :

                            'Posyandu';


                    })


                    ->colors([


                        'warning' =>
                            'mbg',


                        'success' =>
                            'posyandu',


                    ]),






                Tables\Columns\TextColumn::make('date')

                    ->label('Tanggal')

                    ->date('d M Y')

                    ->sortable(),





                Tables\Columns\TextColumn::make('title')

                    ->label('Judul')

                    ->searchable()

                    ->limit(30),





                Tables\Columns\TextColumn::make('start_time')

                    ->label('Jam')

                    ->formatStateUsing(function ($record) {


                        return substr(
                            $record->start_time,
                            0,
                            5
                        )
                        .
                        ' - '
                        .
                        substr(
                            $record->end_time,
                            0,
                            5
                        );


                    }),





                Tables\Columns\TextColumn::make('location')

                    ->label('Lokasi')

                    ->limit(25),





                Tables\Columns\IconColumn::make('is_active')

                    ->label('Aktif')

                    ->boolean(),



            ])




            ->filters([



                Tables\Filters\SelectFilter::make('type')

                    ->label('Jenis')

                    ->options([


                        'mbg' => 'MBG',


                        'posyandu' => 'Posyandu',


                    ]),




                Tables\Filters\TernaryFilter::make('is_active')

                    ->label('Status Aktif'),


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









    public static function getPages(): array
    {

        return [


            'index' => Pages\ListSchedules::route('/'),


            'create' => Pages\CreateSchedule::route('/create'),


            'edit' => Pages\EditSchedule::route('/{record}/edit'),


        ];

    }


}
