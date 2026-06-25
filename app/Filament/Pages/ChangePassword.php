<?php

namespace App\Filament\Pages;

use Filament\Forms\Form;
use Filament\Pages\Page;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Contracts\HasForms;
use Filament\Forms\Concerns\InteractsWithForms;
use Filament\Notifications\Notification;
use Illuminate\Support\Facades\Hash;

class ChangePassword extends Page implements HasForms
{
    use InteractsWithForms;

    protected static ?string $navigationIcon = 'heroicon-o-key';

    protected static ?string $navigationLabel = 'Ubah Password';

    protected static ?string $navigationGroup = 'Sistem';

    protected static string $view = 'filament.pages.change-password';

    public ?array $data = [];

    public function mount(): void
    {
        $this->form->fill();
    }

    public function form(Form $form): Form
    {
        return $form
            ->schema([
                TextInput::make('current_password')
                    ->label('Password Saat Ini')
                    ->password()
                    ->required(),

                TextInput::make('new_password')
                    ->label('Password Baru')
                    ->password()
                    ->required()
                    ->minLength(8),

                TextInput::make('new_password_confirmation')
                    ->label('Konfirmasi Password Baru')
                    ->password()
                    ->same('new_password')
                    ->required(),
            ])
            ->statePath('data');
    }

    public function save(): void
    {
        $data = $this->form->getState();

        if (! Hash::check($data['current_password'], auth()->user()->password)) {
            Notification::make()
                ->title('Password saat ini salah')
                ->danger()
                ->send();

            return;
        }

        auth()->user()->update([
            'password' => Hash::make($data['new_password']),
        ]);

        Notification::make()
            ->title('Password berhasil diubah')
            ->success()
            ->send();

        $this->form->fill();
    }
}
