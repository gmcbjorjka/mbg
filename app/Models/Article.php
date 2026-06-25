<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Article extends Model
{
    protected $fillable = [
        'title',
        'slug',
        'thumbnail',
        'summary',
        'content',
        'category_id',
        'status',
        'is_featured',
        'views',
        'reading_time',
        'author_id',
        'published_at',
    ];

    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    public function author()
    {
        return $this->belongsTo(User::class, 'author_id');
    }
}
