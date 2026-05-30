<?php

namespace App\Filament\Resources\Users;

use App\Filament\Resources\Users\Pages\CreateUser;
use App\Filament\Resources\Users\Pages\EditUser;
use App\Filament\Resources\Users\Pages\ListUsers;
use App\Filament\Resources\Users\Schemas\UserForm;
use App\Filament\Resources\Users\Tables\UsersTable;
use App\Models\User\User;
use BackedEnum;
use Filament\Resources\Resource;
use Filament\Schemas\Schema;
use Filament\Support\Icons\Heroicon;
use Filament\Tables\Table;
use Filament\Forms\Components\TextInput;
use Filament\Tables\Columns\TextColumn;
use Filament\Actions\EditAction;
use Filament\Actions\DeleteAction;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\BulkActionGroup;
use Illuminate\Validation\Rules\Password;
use Illuminate\Support\Facades\Hash;
use Filament\Forms\Components\Select;

class UserResource extends Resource
{
    protected static ?string $model = User::class;

    protected static string|BackedEnum|null $navigationIcon = Heroicon::OutlinedRectangleStack;

    protected static ?string $recordTitleAttribute = 'Users';

    public static function form(Schema $schema): Schema
    {
       
         return $schema->schema([
            TextInput::make('name')
                ->required()
                ->maxLength(255),
            TextInput::make('email')
                ->email()
                ->required()
                ->unique(ignoreRecord: true),
                TextInput::make('slug')
                ->required()
                ->unique(),
                 // Ensures email is unique, ignores the current record during updates
            TextInput::make('password')
                ->password()
                ->required(fn (string $operation): bool => $operation === 'create') // Required only on creation
                ->rule(Password::default()) // Use Laravel's default password rules
                ->dehydrateStateUsing(fn (string $state): string => Hash::make($state)) // Hash the password
                ->visibleOn('create'), // Only visible on the create page
               
             Select::make('roles')
            ->label('Roles')
            ->relationship('roles', 'name') // This links to the roles table
            ->multiple()                     // Allow multiple roles
            ->preload()                       // Load options for dropdown
            ->searchable(),   
    

         ]);
    }

    public static function table(Table $table): Table
    {
        return $table
        ->columns([
            TextColumn::make('name')->searchable()->sortable(),
            TextColumn::make('email')->searchable()->sortable(),
            TextColumn::make('created_at')->dateTime()->sortable()->toggleable(isToggledHiddenByDefault: true),
        ])
        ->filters([
            // Add any filters here (optional)
        ])
        ->actions([
            EditAction::make(),
            DeleteAction::make(),
        ])
           ->bulkActions([ // Use bulkActions() instead of toolbarActions() for the selector
                BulkActionGroup::make([
                    DeleteBulkAction::make()
                        ->visible(fn (): bool => auth()->user()->hasRole('admin')), // Conditionally hide/show
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
            'index' => ListUsers::route('/'),
            'create' => CreateUser::route('/create'),
            'edit' => EditUser::route('/{record}/edit'),
        ];
    }
      public static function mutateFormDataBeforeCreate(array $data): array
    {
        $data['is_admin'] = 1; // Force is_admin to 1 for all new users created here
        
        return $data;
    }
}
