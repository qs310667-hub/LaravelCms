<?php

namespace App\Providers;

use Illuminate\Support\Facades\Vite;
use Illuminate\Support\ServiceProvider;
use App\Http\Responses\LogoutResponse;
use App\Http\Controllers\Filament\CustomLogoutController;
use Filament\Auth\Http\Controllers\LogoutController as BaseLogoutController;
use Filament\Auth\Http\Responses\Contracts\LogoutResponse as LogoutResponseContract;
class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
          $this->app->bind(
            BaseLogoutController::class,
            CustomLogoutController::class
        );
        
        // Override the response
        $this->app->bind(
            LogoutResponseContract::class,
            LogoutResponse::class
        );

    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        Vite::prefetch(concurrency: 3);
        
    }
}
