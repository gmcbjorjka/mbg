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
use App\Http\Controllers\Api\DashboardController;
use App\Http\Controllers\Api\ForgotPasswordController;

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
    ->group(function () {


        Route::post(
            '/login',
            [
                AuthController::class,
                'login'
            ]
        )
        ->middleware('throttle:5,1');



        Route::post(
            '/register/send-otp',
            [
                AuthController::class,
                'sendRegisterOtp'
            ]
        )
        ->middleware('throttle:3,10');

        Route::post(
            '/register/verify-otp',
            [
                AuthController::class,
                'verifyRegisterOtp'
            ]
        )
        ->middleware('throttle:5,1');

        Route::post(
            '/register',
            [
                AuthController::class,
                'register'
            ]
        );



        Route::post(
            '/forgot-password',
            [
                ForgotPasswordController::class,
                'sendOtp'
            ]
        )
        ->middleware('throttle:3,10');



        Route::post(
            '/verify-otp',
            [
                ForgotPasswordController::class,
                'verifyOtp'
            ]
        )
        ->middleware('throttle:5,1');



        Route::post(
            '/reset-password',
            [
                ForgotPasswordController::class,
                'resetPassword'
            ]
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

        Route::post(
            '/change-password',
            [AuthController::class, 'changePassword']
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


        // cek verifikasi terbaru
        Route::get(
            '/latest',
            [
                ConfirmationController::class,
                'latest'
            ]
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

    });


    Route::get(
        '/distribution/today',
        [
            DistributionController::class,
            'today'
        ]
    );


    Route::get(
        '/dashboard',
        [DashboardController::class, 'index']
    );



});
