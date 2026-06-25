<?php

namespace App\Filament\Resources;

use App\Models\Article;
use App\Models\Category;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\Toggle;
use Filament\Forms\Components\DateTimePicker;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Columns\ImageColumn;
use Filament\Forms\Components\FileUpload;
use Filament\Forms\Components\RichEditor;

class ArticleResource extends Resource
{
    protected static ?string $model = Article::class;

    protected static ?string $navigationIcon = 'heroicon-o-document-text';
    protected static ?string $navigationGroup = 'Konten';
    protected static ?string $navigationLabel = 'Artikel';

    public static function form(Form $form): Form
    {
        return $form->schema([
    TextInput::make('title')
        ->label('Judul Artikel')
        ->required()
        ->live(onBlur: true)
        ->afterStateUpdated(
            fn ($state, callable $set) =>
            $set('slug', \Str::slug($state))
        ),

    TextInput::make('slug')
        ->label('Slug URL')
        ->required()
        ->unique(ignoreRecord: true),

    Select::make('category_id')
        ->label('Kategori')
        ->options(Category::all()->pluck('name', 'id'))
        ->searchable()
        ->required(),

    FileUpload::make('thumbnail')
        ->label('Gambar Thumbnail')
        ->image()
        ->directory('articles'),

    Textarea::make('summary')
        ->label('Ringkasan')
        ->rows(3),

    RichEditor::make('content')
        ->label('Isi Artikel')
        ->required()
        ->columnSpanFull(),

    Toggle::make('is_featured')
        ->label('Artikel Unggulan'),

    Select::make('status')
        ->label('Status')
        ->options([
            'draft' => 'Draft',
            'published' => 'Dipublikasikan',
        ])
        ->default('draft')
        ->required(),

    DateTimePicker::make('published_at')
        ->label('Tanggal Publikasi'),

    TextInput::make('reading_time')
        ->label('Waktu Baca (menit)')
        ->disabled()
        ->numeric(),
]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                ImageColumn::make('thumbnail'),

                TextColumn::make('title')
                    ->searchable()
                    ->sortable(),

                TextColumn::make('category.name')
                    ->label('Category'),

                TextColumn::make('status')
                    ->badge(),

                TextColumn::make('views')
                    ->sortable(),

                TextColumn::make('published_at')
                    ->dateTime(),
            ])
            ->actions([
                Tables\Actions\ViewAction::make(),
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
            'index' => \App\Filament\Resources\ArticleResource\Pages\ListArticles::route('/'),
            'create' => \App\Filament\Resources\ArticleResource\Pages\CreateArticle::route('/create'),
            'edit' => \App\Filament\Resources\ArticleResource\Pages\EditArticle::route('/{record}/edit'),

            'view' => \App\Filament\Resources\ArticleResource\Pages\ViewArticle::route('/{record}'),
        ];
    }
}
