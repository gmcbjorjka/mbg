<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;


class Confirmation extends Model
{
    use HasFactory;



    protected $fillable = [

        'distribution_id',

        'user_id',

        'rating',

        'kritik',

        'photo',

        'latitude',

        'longitude',

        'received_at',

        'status',

        'admin_note',

    ];





    protected $casts = [

        'received_at' => 'datetime',

        'latitude' => 'decimal:8',

        'longitude' => 'decimal:8',

    ];







    /**
     * Relasi ke distribusi MBG
     */
    public function distribution()
    {

        return $this->belongsTo(
            Distribution::class,
            'distribution_id'
        );

    }







    /**
     * Relasi ke penerima manfaat
     */
    public function user()
    {

        return $this->belongsTo(
            User::class,
            'user_id'
        );

    }

}