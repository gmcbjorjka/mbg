<?php

namespace App\Filament\Resources;

use App\Models\Category;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\Toggle;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Filament\Tables\Columns\TextColumn;

class CategoryResource extends Resource
{
    protected static ?string $model = Category::class;

    protected static ?string $navigationIcon = 'heroicon-o-tag';
    protected static ?string $navigationGroup = 'Konten';
    protected static ?string $navigationLabel = 'Kategori';

    public static function form(Form $form): Form
    {
        return $form->schema([
            TextInput::make('name')
                ->label('Nama Kategori')
                ->required()
                ->live(onBlur: true)
                ->afterStateUpdated(
                    fn ($state, callable $set) =>
                    $set('slug', \Str::slug($state))
                ),

            TextInput::make('slug')
                ->label('Slug')
                ->required()
                ->unique(ignoreRecord: true)
                ->helperText('URL otomatis dari nama kategori'),

            Textarea::make('description')
                ->label('Deskripsi')
                ->rows(3),

            Toggle::make('is_active')
                ->label('Aktif')
                ->default(true),
        ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('name')
                    ->label('Nama Kategori')
                    ->searchable()
                    ->sortable(),

                TextColumn::make('slug')
                    ->label('Slug'),

                TextColumn::make('is_active')
                    ->label('Status')
                    ->badge()
                    ->formatStateUsing(fn ($state) => $state ? 'Aktif' : 'Nonaktif')
                    ->color(fn ($state) => $state ? 'success' : 'danger'),

                TextColumn::make('created_at')
                    ->label('Dibuat')
                    ->dateTime(),
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\DeleteBulkAction::make(),
            ]);
    }

    public static function getPages(): array
    {
        return [
            'index' => \App\Filament\Resources\CategoryResource\Pages\ListCategories::route('/'),
            'create' => \App\Filament\Resources\CategoryResource\Pages\CreateCategory::route('/create'),
            'edit' => \App\Filament\Resources\CategoryResource\Pages\EditCategory::route('/{record}/edit'),
        ];
    }
}
