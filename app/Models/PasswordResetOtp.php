<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PasswordResetOtp extends Model
{
    protected $fillable = [

        'contact',

        'otp',

        'reset_token',

        'expired_at',

        'verified',

    ];



    protected $casts = [

        'expired_at' => 'datetime',

    ];

}
