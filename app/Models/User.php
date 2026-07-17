<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use Filament\Models\Contracts\FilamentUser;
use Filament\Panel;
use App\Models\Profile;

class User extends Authenticatable implements FilamentUser
{
    use HasApiTokens;
    use HasFactory;
    use Notifiable;

    protected $fillable = [
        'name',
        'email',
        'phone',
        'password',
        'role',
        'status',
    ];

    protected $hidden = [
        'password',
        'remember_token',
    ];

    protected $casts = [
        'password' => 'hashed',
    ];

    public function sppg()
    {
        return $this->belongsTo(Sppg::class);
    }

    public function isSuperAdmin()
    {
        return $this->role === 'super_admin';
    }

    public function isAdmin()
    {
        return $this->role === 'admin';
    }

    public function isBeneficiary()
    {
        return $this->role === 'user';
    }

    public function canAccessPanel(Panel $panel): bool
    {
        return $this->status === 'active'
            && in_array($this->role, [
                'admin',
                'super_admin',
            ]);
    }

    public function profile()
    {
        return $this->hasOne(Profile::class);
    }

    public function confirmations()
{
    return $this->hasMany(
        Confirmation::class,
        'user_id'
    );
}
}
