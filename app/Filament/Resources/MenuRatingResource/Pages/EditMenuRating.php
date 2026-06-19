<?php

namespace App\Filament\Resources\MenuRatingResource\Pages;

use App\Filament\Resources\MenuRatingResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditMenuRating extends EditRecord
{
    protected static string $resource = MenuRatingResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
