<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;


class Distribution extends Model
{

    use HasFactory;



    protected $fillable = [

        'schedule_id',

        'menu_id',

        'jumlah_dikirim',

        'keterangan',

        'status',

    ];



    protected $casts = [

        'jumlah_dikirim' => 'integer',

    ];



    public function schedule()
    {

        return $this->belongsTo(
            Schedule::class
        );

    }



    public function menu()
    {

        return $this->belongsTo(
            MbgMenu::class,
            'menu_id'
        );

    }


   public function confirmations()
{
    return $this->hasMany(
        Confirmation::class,
        'distribution_id'
    )
    ->where('status', 'diterima');
}


}