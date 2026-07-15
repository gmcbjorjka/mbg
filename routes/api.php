<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\ProfileController;

/*
|--------------------------------------------------------------------------
| API Routes (MBG SYSTEM)
|--------------------------------------------------------------------------
*/


// =========================
// AUTH ROUTES
// =========================

Route::prefix('auth')->group(function () {


    // PUBLIC

    Route::post('/login', [
        AuthController::class,
        'login'
    ]);


    Route::post('/register', [
        AuthController::class,
        'register'
    ]);



    // PROTECTED AUTH

    Route::middleware('auth:sanctum')->group(function () {


        Route::get('/me', [
            AuthController::class,
            'me'
        ]);


        Route::post('/logout', [
            AuthController::class,
            'logout'
        ]);


    });


});





// =========================
// PROFILE ROUTES
// =========================

Route::middleware('auth:sanctum')->group(function () {


    // UPDATE DATA PROFILE

    Route::put('/profile', [
        ProfileController::class,
        'update'
    ]);



    // UPLOAD FOTO PROFILE

    Route::post('/profile/photo', [
        ProfileController::class,
        'uploadPhoto'
    ]);



});
