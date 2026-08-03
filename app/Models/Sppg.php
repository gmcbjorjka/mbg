<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Sppg extends Model
{
    protected $fillable = [

        'name',

        'address',

        'posyandu_name',

    ];


    public static function current()
    {
        return self::first();
    }
}