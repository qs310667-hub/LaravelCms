<?php

namespace App\Filament\Resources\Comments\Tables;

use Filament\Actions\BulkActionGroup;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\EditAction;
use Filament\Tables\Table;
use Filament\Actions\DeleteAction;
use Filament\Tables\Columns\ToggleColumn;
use Filament\Tables\Columns\TextColumn;

class CommentsTable
{
    public static function configure(Table $table): Table
    {
        return $table
            ->columns([
                //
            ])
            ->filters([
                //
            ])
            ->columns([
            // ... other columns
              TextColumn::make('text')
                ->label('Comment')
                ->wrap()
                ->searchable(),

            ToggleColumn::make('is_approved')
                ->label('Approved')
                ->onColor('success')
                ->offColor('danger')
                ->onIcon('heroicon-m-check')
                ->offIcon('heroicon-m-x-mark')
                ->searchable(),

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
}
