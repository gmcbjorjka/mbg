<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class MbgMenu extends Model
{
    use HasFactory;


    protected $table = 'mbg_menus';



    protected $fillable = [

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

}
