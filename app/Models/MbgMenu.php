<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Validation\ValidationException;

class MbgMenu extends Model
{
    use HasFactory;


    protected $table = 'mbg_menus';



    protected $fillable = [

        'schedule_id',

        'date',

        'title',

        'image',

        'description',

        'is_active',

    ];



    protected $casts = [

        'date' => 'date',

        'is_active' => 'boolean',

    ];











    /**
     * Relasi ke jadwal MBG
     *
     * Satu menu berasal dari satu schedule
     */
    public function schedule()
    {
        return $this->belongsTo(
            Schedule::class,
            'schedule_id'
        );
    }





    /**
     * Daftar makanan
     */
    public function items()
    {
        return $this->hasMany(
            MbgMenuItem::class,
            'menu_id'
        )
        ->orderBy('sort');
    }





    /**
     * Informasi gizi
     */
    public function nutritions()
    {
        return $this->hasMany(
            MbgMenuNutrition::class,
            'menu_id'
        )
        ->orderBy('sort');
    }





    /**
     * Manfaat menu
     */
    public function benefits()
    {
        return $this->hasMany(
            MbgMenuBenefit::class,
            'menu_id'
        )
        ->orderBy('sort');
    }


    public function distribution()
{
    return $this->hasOne(
        Distribution::class,
        'menu_id'
    );
}
}