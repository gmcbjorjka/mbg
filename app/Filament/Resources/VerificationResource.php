<?php

namespace App\Filament\Resources;

use App\Filament\Resources\VerificationResource\Pages;
use App\Models\Confirmation;
use Filament\Forms\Components\DatePicker;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;

class VerificationResource extends Resource
{
    protected static ?string $model = Confirmation::class;

    protected static ?string $navigationIcon = 'heroicon-o-shield-check';

    protected static ?string $navigationLabel = 'Verifikasi Penerimaan MBG';

    protected static ?string $navigationGroup = 'Operasional';

    protected static ?int $navigationSort = 4;

    protected static ?string $modelLabel = 'Verifikasi Penerimaan MBG';

    protected static ?string $pluralModelLabel = 'Daftar Verifikasi Penerimaan';

    public static function table(Table $table): Table
    {
        return $table
            ->columns([

                /*
                |--------------------------------------------------------------------------
                | Data Penerima
                |--------------------------------------------------------------------------
                */

                Tables\Columns\TextColumn::make('user.name')
                    ->label('Penerima')
                    ->searchable()
                    ->sortable(),

                /*
                |--------------------------------------------------------------------------
                | Jadwal MBG
                |--------------------------------------------------------------------------
                */

                Tables\Columns\TextColumn::make('distribution.schedule.date')
                    ->label('Tanggal MBG')
                    ->date('d M Y')
                    ->sortable(),

                Tables\Columns\TextColumn::make('distribution.schedule.title')
                    ->label('Jadwal MBG')
                    ->limit(35),

                /*
                |--------------------------------------------------------------------------
                | Bukti Foto
                |--------------------------------------------------------------------------
                */

                Tables\Columns\ImageColumn::make('photo')
                    ->label('Foto Bukti')
                    ->disk('public')
                    ->height(60)
                    ->square()
                    ->url(
                        fn (Confirmation $record) => asset('storage/' . $record->photo),
                        true
                    ),

                /*
|--------------------------------------------------------------------------
| Lokasi
|--------------------------------------------------------------------------
*/

Tables\Columns\IconColumn::make('location')
    ->label('Lokasi')
    ->state(fn () => true)
    ->icon('heroicon-o-map-pin')
    ->color('primary')
    ->tooltip('Lihat di Google Maps')
    ->url(
        fn (Confirmation $record) =>
            $record->latitude && $record->longitude
                ? "https://www.google.com/maps?q={$record->latitude},{$record->longitude}"
                : null,
        true
    ),

                /*
                |--------------------------------------------------------------------------
                | Waktu Terima
                |--------------------------------------------------------------------------
                */

                Tables\Columns\TextColumn::make('received_at')
                    ->label('Waktu Terima')
                    ->dateTime('d M Y H:i')
                    ->sortable(),

                /*
                |--------------------------------------------------------------------------
                | Status
                |--------------------------------------------------------------------------
                */

                Tables\Columns\BadgeColumn::make('status')
                    ->label('Status')
                    ->colors([
                        'warning' => 'menunggu',
                        'success' => 'diterima',
                        'danger' => 'ditolak',
                    ]),
            ])

            ->filters([

                Tables\Filters\Filter::make('tanggal_mbg')
                    ->label('Tanggal Jadwal MBG')
                    ->form([
                        DatePicker::make('tanggal')
                            ->label('Pilih Tanggal'),
                    ])
                    ->query(function (Builder $query, array $data) {
                        return $query->when(
                            $data['tanggal'] ?? null,
                            function (Builder $query, $tanggal) {
                                $query->whereHas(
                                    'distribution.schedule',
                                    function (Builder $schedule) use ($tanggal) {
                                        $schedule->whereDate(
                                            'date',
                                            $tanggal
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

    public static function getRelations(): array
    {
        return [];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListVerifications::route('/'),
        ];
    }
}
