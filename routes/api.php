<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::post('login', 'LoginController@index');
Route::post('register', 'RegisterController@index');
Route::get('role', 'RegisterController@getRole');

// Route::middleware('auth:api')->get('/user', function (Request $request) {
//     return $request->user();
// });

Route::group(['middleware' => 'auth:api'], function () {
    Route::ApiResource('user', 'UserController');

    Route::get('export', 'DataController@export');
    Route::post('import', 'DataController@import');

    Route::get('logout', 'LoginController@logoutApi');
});
