<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MbgMenuBenefit extends Model
{
    protected $table = 'mbg_menu_benefits';


    protected $fillable = [

        'menu_id',

        'description',

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
