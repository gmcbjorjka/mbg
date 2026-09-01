<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class RegisterOtp extends Model
{
    protected $fillable = [
        'email',
        'otp',
        'expired_at',
        'verified',
    ];

    protected $casts = [
        'expired_at' => 'datetime',
        'verified' => 'boolean',
    ];
}
