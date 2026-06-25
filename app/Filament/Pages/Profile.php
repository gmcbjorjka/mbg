<?php

namespace App\Filament\Pages;

use App\Models\User;
use Filament\Forms\Form;
use Filament\Pages\Page;
use Filament\Actions\Action;
use Filament\Notifications\Notification;
use Filament\Forms\Contracts\HasForms;
use Filament\Forms\Concerns\InteractsWithForms;
use Filament\Forms\Components\Section;
use Filament\Forms\Components\TextInput;
use Illuminate\Validation\ValidationException;

class Profile extends Page implements HasForms
{
    use InteractsWithForms;

    protected static ?string $navigationIcon = 'heroicon-o-user-circle';

    protected static ?string $navigationLabel = 'Profile';

    protected static ?string $navigationGroup = 'Sistem';

    protected static string $view = 'filament.pages.profile';

    public ?array $data = [];

    public function mount(): void
    {
        $user = auth()->user();

        $this->form->fill([
            'name' => $user->name,
            'email' => $user->email,
            'phone' => $user->phone,
            'role' => ucfirst(str_replace('_', ' ', $user->role)),
            'status' => ucfirst($user->status),
            'created_at' => $user->created_at?->format('d M Y H:i'),
        ]);
    }

    public function form(Form $form): Form
    {
        return $form
            ->schema([
                Section::make('Account Information')
                    ->description('Manage your account information.')
                    ->schema([
                        TextInput::make('name')
                            ->label('Full Name')
                            ->required()
                            ->maxLength(255),

                        TextInput::make('email')
    ->label('Email Address')
    ->email()
    ->disabled()
    ->dehydrated(false),

                        TextInput::make('phone')
                            ->label('Phone Number')
                            ->tel(),
                    ])
                    ->columns(2),

                Section::make('Account Details')
                    ->schema([
                        TextInput::make('role')
                            ->disabled(),

                        TextInput::make('status')
                            ->disabled(),

                        TextInput::make('created_at')
                            ->label('Member Since')
                            ->disabled(),
                    ])
                    ->columns(3),
            ])
            ->statePath('data');
    }

    protected function getHeaderActions(): array
    {
        return [
            Action::make('changePassword')
                ->label('Change Password')
                ->icon('heroicon-o-key')
                ->url('/admin/change-password'),
        ];
    }

    public function save(): void
    {
        $data = $this->form->getState();





        auth()->user()->update([
            'name' => $data['name'],
            'phone' => $data['phone'],
        ]);

        Notification::make()
            ->title('Profile updated successfully.')
            ->success()
            ->send();
    }
}
