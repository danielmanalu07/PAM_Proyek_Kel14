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

        Route::get('ib', 'IzinBermalamController@index');
        Route::post('ib', 'IzinBermalamController@store');
        Route::put('ib/{ib}', 'IzinBermalamController@update');

        Route::get('surat', 'SuratController@index');
        Route::post('surat', 'SuratController@store');
        Route::put('surat/{surat}', 'SuratController@update');

        Route::get('br', 'BookingRuanganController@index');
        Route::post('br', 'BookingRuanganController@store');
        Route::put('br/{br}', 'BookingRuanganController@update');

        Route::get('getRuangan', 'MahasiswaController@getRuangan');
    });
});

Route::prefix('/admin')->namespace('App\Http\Controllers\Admin')->group(function () {
    Route::post('login', 'AdminController@login');
    Route::group(['middleware' => ['auth:sanctum']], function () {
        Route::get('user', 'AdminController@user');
        Route::post('logout', 'AdminController@logout');
        Route::put('izin-keluars/{izinKeluar}', 'AdminController@update');
        Route::put('ib/{ib}', 'AdminController@updateib');
        Route::put('surat/{surat}', 'AdminController@updatesurat');
        Route::get('getik', 'AdminController@getIK');
        Route::get('getib', 'AdminController@getIB');
        Route::get('getmhs', 'AdminController@getmhs');
        Route::get('getsurat', 'AdminController@getSurat');
        Route::get('ruangan', 'RuanganController@index');
        Route::post('addruangan', 'RuanganController@store');
        Route::put('editruangan/{editruangan}', 'RuanganController@update');
        Route::delete('deleteruangan/{deleteruangan}', 'RuanganController@destroy');
        Route::get('getbr', 'AdminController@getBookingRuangan');
        Route::get('getRuangan', 'AdminController@getRuangan');
        Route::put('br/{br}', 'AdminController@updateBr');

        Route::get('kaos', 'KaosController@index');
        Route::post('addkaos', 'KaosController@store');
        Route::put('editkaos/{editkaos}', 'KaosController@update');
        Route::delete('deletekaos/{deletekaos}', 'KaosController@destroy');
    });
});
