<?php

namespace App\Filament\Resources\AdminResource\Pages;

use App\Filament\Resources\AdminResource;
use Filament\Resources\Pages\CreateRecord;

class CreateAdmin extends CreateRecord
{
    protected static string $resource = AdminResource::class;


    protected function mutateFormDataBeforeCreate(array $data): array
    {

        // semua akun dari halaman ini menjadi admin

        $data['role'] = 'admin';


        // admin langsung aktif

        $data['status'] = 'active';


        return $data;

    }

}
