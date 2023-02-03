<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});
Route::controller(UserController::class)->middleware(['throttle:test'])->prefix('/user')->as('user')->group(function(){
    Route::get('/user', 'index');
    Route::get('/user/create', 'create');
    Route::get('/user/register-master', 'registerMaster');
    Route::get('/user/signal', 'signals');
    Route::get('/test-lock', 'testLock');
    Route::get('/test-lock-2', 'testLock2');
    Route::get('/test-lock-3', 'testLock3');
});

