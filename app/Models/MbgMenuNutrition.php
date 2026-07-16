<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class MbgMenuNutrition extends Model
{
    use HasFactory;


    protected $table = 'mbg_menu_nutritions';



    protected $fillable = [

        'menu_id',

        'name',

        'value',

        'sort',

    ];



    public function menu()
    {
        return $this->belongsTo(
            MbgMenu::class,
            'menu_id'
        );
    }

}
