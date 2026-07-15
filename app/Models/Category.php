<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    protected $table = 'categories';


    protected $fillable = [

        'name',
        'slug',
        'description',
        'icon',
        'color',
        'is_active',

    ];



    protected $casts = [

        'is_active' => 'boolean',

    ];



    public function articles()
    {
        return $this->hasMany(
            Article::class,
            'category_id'
        );
    }

}
