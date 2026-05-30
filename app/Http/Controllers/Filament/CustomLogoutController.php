<?php
// app/Http/Controllers/Filament/CustomLogoutController.php

namespace App\Http\Controllers\Filament;

use Filament\Auth\Http\Controllers\LogoutController as BaseLogoutController;
use Filament\Auth\Http\Responses\Contracts\LogoutResponse;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;
use Filament\Facades\Filament;

class CustomLogoutController extends BaseLogoutController
{
    public function __invoke(): LogoutResponse
    {
      $adminSessionKey = Auth::guard('admin')->getName();
        
        // Logout admin
        Filament::auth()->logout();
        
        // Remove only admin session data
        Session::forget($adminSessionKey);
        
        return app(LogoutResponse::class);
    }
}