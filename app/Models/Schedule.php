<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;

class Schedule extends Model
{
    protected $fillable = [

        'type',

        'date',

        'title',

        'start_time',

        'end_time',

        'location',

        'address',

        'image',

        'description',

        'is_active',

    ];





    protected $casts = [


        'date' => 'date',


        'is_active' => 'boolean',


    ];





    protected $appends = [

        'image_url',

        'status',

    ];







    public function getImageUrlAttribute()
    {


        if (!$this->image) {

            return null;

        }



        return asset(
            'storage/'.$this->image
        );


    }








    public function getStatusAttribute()
    {


        if (
            Carbon::parse($this->date)
            ->startOfDay()
            ->isPast()
        ) {

            return 'selesai';

        }



        return 'akan_datang';


    }






}
