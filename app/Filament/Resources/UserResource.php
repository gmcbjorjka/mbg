<?php

namespace App\Filament\Resources;

use App\Filament\Resources\UserResource\Pages;
use App\Filament\Resources\UserResource\RelationManagers;
use App\Models\User;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Select;
use Illuminate\Support\Facades\Hash;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Filament\Forms\Components\Section;
use Filament\Forms\Components\Grid;

class UserResource extends Resource
{
    protected static ?string $model = User::class;

    protected static ?string $navigationIcon = 'heroicon-o-user-group';
    protected static ?string $navigationLabel = 'Manajemen User';
    protected static ?string $navigationGroup = 'Sistem';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Section::make('Informasi Pengguna')
                    ->description('Data akun pengguna sistem')
                    ->schema([
                        Grid::make(2)
                            ->schema([
                                TextInput::make('name')
                                    ->label('Nama Lengkap')
                                    ->required()
                                    ->maxLength(255)
                                    ->validationMessages([
                                        'required' => 'Nama lengkap wajib diisi.',
                                        'max' => 'Nama maksimal 255 karakter.',
                                    ]),

                                TextInput::make('email')
                                    ->label('Email')
                                    ->email()
                                    ->required()
                                    ->unique(
                                        table: User::class,
                                        column: 'email',
                                        ignoreRecord: true
                                    )
                                    ->validationMessages([
                                        'required' => 'Email wajib diisi.',
                                        'email' => 'Format email tidak valid.',
                                        'unique' => 'Email sudah terdaftar.',
                                    ]),

                                Select::make('role')
                                    ->label('Role')
                                    ->options([
                                        'admin' => 'Admin',
                                        'user' => 'User',
                                    ])
                                    ->required()
                                    ->validationMessages([
                                        'required' => 'Role wajib dipilih.',
                                    ]),

                                Forms\Components\Hidden::make('status')
                                    ->default('inactive'),

                                TextInput::make('password')
                                    ->label('Password Awal')
                                    ->password()
                                    ->required(fn (string $operation) => $operation === 'create')
                                    ->hidden(fn (string $operation) => $operation === 'edit')
                                    ->minLength(8)
                                    ->dehydrateStateUsing(
                                        fn (string $state): string => Hash::make($state)
                                    )
                                    ->validationMessages([
                                        'required' => 'Password wajib diisi.',
                                        'min' => 'Password minimal 8 karakter.',
                                    ]),
                            ]),
                    ])
                    ->columns(1),
            ]);
    }


    public static function table(Table $table): Table
    {
        return $table
            ->modifyQueryUsing(function (Builder $query) {
                $query
                    ->where('id', '!=', auth()->id())
                    ->where('role', '!=', 'super_admin');
            })
            ->columns([
                Tables\Columns\TextColumn::make('name')
                    ->searchable(),

                Tables\Columns\TextColumn::make('email')
                    ->searchable(),

                Tables\Columns\TextColumn::make('role')
                    ->badge(),
            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }
    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListUsers::route('/'),
            'create' => Pages\CreateUser::route('/create'),
            'edit' => Pages\EditUser::route('/{record}/edit'),
        ];
    }
}
