<?php
// app/Http/Responses/LogoutResponse.php

namespace App\Http\Responses;

use Filament\Auth\Http\Responses\Contracts\LogoutResponse as LogoutResponseContract;
use Illuminate\Http\RedirectResponse;

class LogoutResponse implements LogoutResponseContract
{
    public function toResponse($request): RedirectResponse
    {
        // Just handle redirect - session is already preserved by controller
        return redirect()->route('login');
    }
}