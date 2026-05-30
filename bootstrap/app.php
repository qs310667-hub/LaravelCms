<?php

use Illuminate\Foundation\Application;
use Illuminate\Foundation\Configuration\Exceptions;
use Illuminate\Foundation\Configuration\Middleware;
use App\Http\Middleware\checkroute; 
use App\Http\Middleware\PreventCache; 
return Application::configure(basePath: dirname(__DIR__))
    ->withRouting(
        web: __DIR__.'/../routes/web.php',
        commands: __DIR__.'/../routes/console.php',
        health: '/up',
         then: function () {
            Route::middleware('web') // Apply web middleware group
                ->prefix('api')      // Add '/admin' prefix to all routes in this file
                ->name('api.')      // Add 'admin.' name prefix to all routes
                ->group(base_path('routes/api.php')); 
                 Route::middleware('web') // Apply web middleware group
                ->name('frontend-routes.')      // Add 'admin.' name prefix to all routes
                ->group(base_path('routes/frontend-routes.php')); // Load the custom file
        },
    )
    ->withMiddleware(function (Middleware $middleware): void {
        $middleware->web(append: [
            \App\Http\Middleware\HandleInertiaRequests::class,
            \Illuminate\Http\Middleware\AddLinkHeadersForPreloadedAssets::class,
        ]);

         $middleware->alias([
            'checkroute' => checkroute::class,
             'no-cache' => PreventCache::class,
        ]);
    })
    ->withExceptions(function (Exceptions $exceptions): void {
        //
    })->create();
