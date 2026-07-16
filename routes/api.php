<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\ProfileController;
use App\Http\Controllers\Api\CategoryController;
use App\Http\Controllers\Api\ArticleController;
use App\Http\Controllers\Api\MbgMenuController;
use App\Http\Controllers\Api\ScheduleController;

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


Route::prefix('education')->group(function () {


    // kategori edukasi
    Route::get('/categories', [
        CategoryController::class,
        'index'
    ]);


    // semua artikel published
    Route::get('/articles', [
        ArticleController::class,
        'index'
    ]);


    // detail artikel
    Route::get('/articles/{slug}', [
        ArticleController::class,
        'show'
    ]);


});


Route::prefix('mbg')->group(function () {

    Route::get(
        '/menu',
        [MbgMenuController::class,'index']
    );


    Route::get(
        '/menu/today',
        [MbgMenuController::class,'today']
    );


    Route::get(
        '/menu/{id}',
        [MbgMenuController::class,'show']
    );

});

Route::get(
    '/schedules',
    [
        ScheduleController::class,
        'index'
    ]
);
