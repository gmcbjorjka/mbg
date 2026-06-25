<?php

namespace App\Filament\Auth;

use App\Models\User;
use Filament\Http\Responses\Auth\Contracts\LoginResponse;
use Filament\Pages\Auth\Login as BaseLogin;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\ValidationException;

class Login extends BaseLogin
{
    public function authenticate(): ?LoginResponse
    {
        $data = $this->form->getState();

        $user = User::where('email', $data['email'])->first();

        if (! $user) {
            throw ValidationException::withMessages([
                'data.email' => 'Invalid email or password.',
            ]);
        }

        if (! Auth::attempt([
            'email' => $data['email'],
            'password' => $data['password'],
        ], $data['remember'] ?? false)) {
            throw ValidationException::withMessages([
                'data.email' => 'Invalid email or password.',
            ]);
        }

        if ($user->status !== 'active') {
            Auth::logout();

            throw ValidationException::withMessages([
                'data.email' => 'Your account is inactive. Please contact the administrator.',
            ]);
        }

        if ($user->role === 'user') {
            Auth::logout();

            throw ValidationException::withMessages([
                'data.email' => 'This account can only access the mobile application.',
            ]);
        }

        session()->regenerate();

        return app(LoginResponse::class);
    }
}
