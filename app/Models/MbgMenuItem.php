<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class MbgMenuItem extends Model
{
    use HasFactory;


    protected $table = 'mbg_menu_items';



    protected $fillable = [

        'menu_id',

        'name',

        'type',

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
