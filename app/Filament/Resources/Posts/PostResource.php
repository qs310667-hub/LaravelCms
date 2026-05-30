<?php

namespace App\Filament\Resources\Posts;

use App\Filament\Resources\Posts\Pages\CreatePost;
use App\Filament\Resources\Posts\Pages\EditPost;
use App\Filament\Resources\Posts\Pages\ListPosts;
use App\Filament\Resources\Posts\Schemas\PostForm;
use App\Filament\Resources\Posts\Tables\PostsTable;
use App\Models\Posts\Post;
use Filament\Forms\Components\TextInput;
use Filament\Forms;
use BackedEnum;
use Filament\Schemas\Schema;  // ✅ Use Schema, not Form

use Filament\Resources\Resource;

use Filament\Support\Icons\Heroicon;
use Filament\Tables\Table;
use RalphJSmit\Filament\SEO\SEO;
use Filament\Forms\Components\FileUpload;
use Filament\Forms\Components\Toggle;
use Filament\Schemas\Components\Section;


class PostResource extends Resource
{
    protected static ?string $model = Post::class;

    protected static string|BackedEnum|null $navigationIcon = Heroicon::OutlinedRectangleStack;

    protected static ?string $recordTitleAttribute = 'any';


    public static function form(Schema $schema): Schema
    {
        return $schema->schema([
             // ✅ YOUR EXISTING FIELDS (keep all)
            TextInput::make('title')
                ->required(),
            
            TextInput::make('slug')
                ->unique()
                ->required(),
            
            Forms\Components\RichEditor::make('body')
                ->required()
                ->columnSpanFull(),
            
            FileUpload::make('feature_image')
                    ->image(),
           Forms\Components\Select::make('category_id')
    ->relationship('category', 'name')
    ->required()
    ->columnSpanFull(),

                  Forms\Components\Select::make('tags')
                ->relationship('tags', 'name') // Use your column name
                ->multiple() // Allow multiple tags
                ->searchable()
                ->preload()
                ->createOptionForm([ // Allow creating new tags
                    \Filament\Forms\Components\TextInput::make('name')
                        ->required()
                        ->maxLength(255),
                ])
                ->columnSpanFull(),
            
            Forms\Components\Select::make('status')
                ->options([
                    'draft' => 'Draft',
                    'published' => 'Published',
                ])
                ->default('draft')
                ->required(),
                 Section::make('SEO')
                ->columnSpan('full')
                ->schema([
            SEO::make(),
    
                         ])
                ->collapsible(),
            Forms\Components\Toggle::make('is_staff_pick')
    ->label('Staff Pick')
    ->helperText('Feature this post as a staff pick?'),

           
        ]);
    }

    public static function table(Table $table): Table
    {
        return PostsTable::configure($table);
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
            'index' => ListPosts::route('/'),
            'create' => CreatePost::route('/create'),
            'edit' => EditPost::route('/{record}/edit'),
        ];
    }
    
}
