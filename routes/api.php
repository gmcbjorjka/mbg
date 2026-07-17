<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\ProfileController;
use App\Http\Controllers\Api\CategoryController;
use App\Http\Controllers\Api\ArticleController;
use App\Http\Controllers\Api\MbgMenuController;
use App\Http\Controllers\Api\ScheduleController;
use App\Http\Controllers\Api\ConfirmationController;
use App\Http\Controllers\Api\DistributionController;

/*
|--------------------------------------------------------------------------
| API MBG
|--------------------------------------------------------------------------
|
| Login & Register : Public
| Semua endpoint lain wajib menggunakan Bearer Token (Sanctum)
|
*/


/*
|--------------------------------------------------------------------------
| AUTH (PUBLIC)
|--------------------------------------------------------------------------
*/

Route::prefix('auth')
    ->middleware('throttle:5,1')
    ->group(function () {

        Route::post(
            '/login',
            [AuthController::class, 'login']
        );

        Route::post(
            '/register',
            [AuthController::class, 'register']
        );

    });




/*
|--------------------------------------------------------------------------
| PROTECTED API
|--------------------------------------------------------------------------
*/

Route::middleware('auth:sanctum')->group(function () {


    /*
    |--------------------------------------------------------------------------
    | AUTH
    |--------------------------------------------------------------------------
    */

    Route::prefix('auth')->group(function () {

        Route::get(
            '/me',
            [AuthController::class, 'me']
        );

        Route::post(
            '/logout',
            [AuthController::class, 'logout']
        );

    });





    /*
    |--------------------------------------------------------------------------
    | PROFILE
    |--------------------------------------------------------------------------
    */

    Route::prefix('profile')->group(function () {

        Route::put(
            '/',
            [ProfileController::class, 'update']
        );

        Route::post(
            '/photo',
            [ProfileController::class, 'uploadPhoto']
        );

    });






    /*
    |--------------------------------------------------------------------------
    | EDUKASI
    |--------------------------------------------------------------------------
    */

    Route::prefix('education')->group(function () {

        Route::get(
            '/categories',
            [CategoryController::class, 'index']
        );

        Route::get(
            '/articles',
            [ArticleController::class, 'index']
        );

        Route::get(
            '/articles/{slug}',
            [ArticleController::class, 'show']
        );

    });







    /*
    |--------------------------------------------------------------------------
    | MENU MBG
    |--------------------------------------------------------------------------
    */

    Route::prefix('mbg')->group(function () {

        Route::get(
            '/menu',
            [MbgMenuController::class, 'index']
        );

        Route::get(
            '/menu/today',
            [MbgMenuController::class, 'today']
        );

        Route::get(
            '/menu/{menu}',
            [MbgMenuController::class, 'show']
        );

    });







    /*
    |--------------------------------------------------------------------------
    | JADWAL MBG
    |--------------------------------------------------------------------------
    */



    Route::get(
        '/schedules',
        [ScheduleController::class, 'index']
    );










    /*
    |--------------------------------------------------------------------------
    | VERIFIKASI PENERIMAAN MBG
    |--------------------------------------------------------------------------
    */

    Route::prefix('confirmation')->group(function () {

        // daftar verifikasi milik user
        Route::get(
            '/',
            [ConfirmationController::class, 'index']
        );

        // detail verifikasi
        Route::get(
            '/{confirmation}',
            [ConfirmationController::class, 'show']
        );

        // kirim verifikasi
        Route::post(
            '/',
            [ConfirmationController::class, 'store']
        );

        Route::get(
            '/latest',
            [
            ConfirmationController::class,
            'latest'
        ]
        );

    });


    Route::get(
        '/distribution/today',
        [
            DistributionController::class,
            'today'
        ]
    );



});
