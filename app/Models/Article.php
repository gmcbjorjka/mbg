<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Article extends Model
{
    protected $table = 'articles';



    protected $fillable = [

        'category_id',

        'title',

        'slug',

        'thumbnail',

        'summary',

        'content',

        'status',

        'is_featured',

        'views',

        'reading_time',

        'author_id',

        'published_at',

    ];



    protected $casts = [

        'is_featured' => 'boolean',

        'views' => 'integer',

        'reading_time' => 'integer',

        'published_at' => 'datetime',

    ];





    /**
     * Relasi kategori artikel
     */
    public function category()
    {

        return $this->belongsTo(
            Category::class,
            'category_id'
        );

    }





    /**
     * Relasi penulis artikel
     */
    public function author()
    {

        return $this->belongsTo(
            User::class,
            'author_id'
        );

    }

}
