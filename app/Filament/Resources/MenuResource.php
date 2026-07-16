<?php

namespace App\Filament\Resources;

use App\Models\MbgMenu;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use App\Filament\Resources\MenuResource\Pages;
use App\Filament\Resources\MenuResource\RelationManagers;

class MenuResource extends Resource
{
    protected static ?string $model = MbgMenu::class;


    protected static ?string $navigationIcon = 'heroicon-o-cake';


    protected static ?string $navigationLabel = 'Menu MBG';


    protected static ?string $navigationGroup = 'Data Master';



    public static function form(Form $form): Form
    {
        return $form
            ->schema([


                Forms\Components\DatePicker::make('date')

                    ->label('Tanggal Menu')

                    ->required(),




                Forms\Components\TextInput::make('title')

                    ->label('Judul Menu')

                    ->default('Menu Hari Ini')

                    ->required()

                    ->maxLength(255),





                Forms\Components\FileUpload::make('image')

                    ->label('Gambar Menu')

                    ->image()

                    ->directory('menus')

                    ->nullable(),


                Forms\Components\Textarea::make('description')

                ->label('Keterangan Menu')

                ->placeholder(
                    'Contoh: Menu sehat dengan kandungan gizi seimbang untuk ibu hamil dan balita'
                )

                ->rows(4)

                ->nullable()

                ->columnSpanFull(),


                Forms\Components\Toggle::make('is_active')

                    ->label('Menu Aktif')

                    ->default(true)

                    ->onColor('success')

                    ->offColor('danger'),



            ]);
    }






    public static function table(Table $table): Table
    {
        return $table
            ->columns([



                Tables\Columns\ImageColumn::make('image')

                    ->label('Foto')

                    ->circular(),





                Tables\Columns\TextColumn::make('title')

                    ->label('Menu')

                    ->searchable()

                    ->sortable(),





                Tables\Columns\TextColumn::make('date')

                    ->label('Tanggal')

                    ->date('d M Y')

                    ->sortable(),





                Tables\Columns\IconColumn::make('is_active')

                    ->label('Status')

                    ->boolean(),





                Tables\Columns\TextColumn::make('items_count')

                    ->label('Item')

                    ->counts('items'),



            ])

            ->actions([

                Tables\Actions\EditAction::make(),


                Tables\Actions\DeleteAction::make(),

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


            RelationManagers\ItemsRelationManager::class,


            RelationManagers\NutritionsRelationManager::class,


            RelationManagers\BenefitsRelationManager::class,


        ];
    }






    public static function getPages(): array
    {
        return [

            'index' => Pages\ListMenus::route('/'),

            'create' => Pages\CreateMenu::route('/create'),

            'edit' => Pages\EditMenu::route('/{record}/edit'),

        ];
    }

}
