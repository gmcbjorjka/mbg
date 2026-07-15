<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Profile extends Model
{
    protected $fillable = [

        'user_id',

        'address',

        'nik',

        'birth_date',

        'gender',

        'beneficiary_type',

        'photo',

    ];



    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
