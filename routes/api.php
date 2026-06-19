<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AuthController;

/*
|--------------------------------------------------------------------------
| API Routes (MBG SYSTEM)
|--------------------------------------------------------------------------
*/

// =========================
// AUTH ROUTES
// =========================
Route::prefix('auth')->group(function () {

    // LOGIN (public)
    Route::post('/login', [AuthController::class, 'login']);

    // PROTECTED AUTH
    Route::middleware('auth:sanctum')->group(function () {
        Route::get('/me', [AuthController::class, 'me']);
        Route::post('/logout', [AuthController::class, 'logout']);
    });
});
