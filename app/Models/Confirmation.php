<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

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



    protected $appends = [

        'photo_url',

    ];



    /*
    |--------------------------------------------------------------------------
    | Relationship
    |--------------------------------------------------------------------------
    */

    /**
     * Distribusi MBG
     */
    public function distribution()
    {
        return $this->belongsTo(
            Distribution::class,
            'distribution_id'
        );
    }



    /**
     * Penerima Manfaat
     */
    public function user()
    {
        return $this->belongsTo(
            User::class,
            'user_id'
        );
    }



    /*
    |--------------------------------------------------------------------------
    | Accessor
    |--------------------------------------------------------------------------
    */

    /**
     * URL Foto Bukti
     */
    public function getPhotoUrlAttribute()
    {
        if (!$this->photo) {

            return null;

        }

        return asset(
            'storage/' . $this->photo
        );
    }
}