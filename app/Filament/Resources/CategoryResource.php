<?php

namespace App\Filament\Resources;

use App\Models\Category;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\Toggle;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\ColorPicker;
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

    protected static ?string $modelLabel = 'Kategori';

protected static ?string $pluralModelLabel = 'Daftar Kategori';



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

                ->helperText(
                    'URL otomatis dari nama kategori'
                ),



            Textarea::make('description')

                ->label('Deskripsi')

                ->rows(3),



           Select::make('icon')

    ->label('Icon Kategori')

    ->options([


        'stunting'
            => 'Stunting',


        'gizi'
            => 'Gizi',


        'mbg'
            => 'MBG (Makan Bergizi Gratis)',


        'kesehatan'
            => 'Kesehatan',


        'info'
            => 'Informasi',


        'balita'
            => 'Balita',


        'ibu_hamil'
            => 'Ibu Hamil',


        'vitamin'
            => 'Vitamin',


    ])

    ->searchable(),




            ColorPicker::make('color')

                ->label('Warna Kategori')

                ->default('#1976D2'),




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



                TextColumn::make('icon')

                    ->label('Icon'),




                TextColumn::make('color')

                    ->label('Warna')

                    ->badge(),




                TextColumn::make('slug')

                    ->label('Slug'),




                TextColumn::make('is_active')

                    ->label('Status')

                    ->badge()

                    ->formatStateUsing(
                        fn ($state) =>
                        $state
                            ? 'Aktif'
                            : 'Nonaktif'
                    )

                    ->color(
                        fn ($state) =>
                        $state
                            ? 'success'
                            : 'danger'
                    ),




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

            'index' =>
                \App\Filament\Resources\CategoryResource\Pages\ListCategories::route('/'),


            'create' =>
                \App\Filament\Resources\CategoryResource\Pages\CreateCategory::route('/create'),


            'edit' =>
                \App\Filament\Resources\CategoryResource\Pages\EditCategory::route('/{record}/edit'),

        ];
    }
}
