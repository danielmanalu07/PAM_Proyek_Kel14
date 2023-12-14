<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
 */

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });

Route::prefix('/mahasiswa')->namespace('App\Http\Controllers\Mahasiswa')->group(function () {
    Route::post('register', 'MahasiswaController@register');
    Route::post('login', 'MahasiswaController@login');
    Route::group(['middleware' => ['auth:sanctum']], function () {
        Route::get('user', 'MahasiswaController@user');
        Route::post('logout', 'MahasiswaController@logout');

        Route::get('izin-keluars', 'IzinKeluarController@index');
        Route::post('izin-keluars', 'IzinKeluarController@store');
        Route::put('izin-keluars/{izinKeluar}', 'IzinKeluarController@update');
    });
});

Route::prefix('/admin')->namespace('App\Http\Controllers\Admin')->group(function () {
    Route::post('login', 'AdminController@login');
    Route::group(['middleware' => ['auth:sanctum']], function () {
        Route::get('user', 'AdminController@user');
        Route::post('logout', 'AdminController@logout');
        Route::put('izin-keluars/{izinKeluar}', 'AdminController@update');
        Route::get('getik', 'AdminController@getIK');
    });
});
