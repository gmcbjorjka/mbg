<?php

namespace App\Filament\Resources;

use App\Filament\Resources\MenuRatingResource\Pages;
use App\Filament\Resources\MenuRatingResource\RelationManagers;
use App\Models\MenuRating;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class MenuRatingResource extends Resource
{
    protected static ?string $model = MenuRating::class;

    protected static ?string $navigationIcon = 'heroicon-o-star';
    protected static ?string $navigationLabel = 'Rating Menu MBG';
    protected static ?string $navigationGroup = 'Feedback';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                //
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                //
            ])
            ->filters([
                //
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
            'index' => Pages\ListMenuRatings::route('/'),
            'create' => Pages\CreateMenuRating::route('/create'),
            'edit' => Pages\EditMenuRating::route('/{record}/edit'),
        ];
    }
}
