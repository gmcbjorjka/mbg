<?php

namespace App\Filament\Resources\MenuRatingResource\Pages;

use App\Filament\Resources\MenuRatingResource;
use Filament\Resources\Pages\ListRecords;


class ListMenuRatings extends ListRecords
{

    protected static string $resource =
        MenuRatingResource::class;



    protected function getHeaderActions(): array
    {

        return [];

    }

}