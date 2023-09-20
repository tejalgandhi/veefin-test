<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\AuthController;
use App\Http\Controllers\Auth\SocialiteController;
use App\Http\Controllers\RoleController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\ProductController;
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

Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home')->middleware(['auth']);
Route::get('account/verify/{token}', [AuthController::class, 'verifyAccount'])->name('user.verify');


Route::controller(SocialiteController::class)->group(function(){
    Route::get('auth/google', 'redirect')->name('auth.google');
    Route::get('auth/google/callback', 'callback');
    Route::get('auth/facebook', 'redirect')->name('auth.facebook');
    Route::get('auth/facebook/callback', 'callback');
});

Route::group(['middleware' => ['auth']], function() {
    Route::resource('roles', RoleController::class);
    Route::resource('users', UserController::class);
    Route::resource('products', ProductController::class);
    Route::get('buy-product/{product}', [ProductController::class, 'getBuyProduct'])->name('buy-product.get');
    Route::post('buy-product', [ProductController::class, 'buyProduct'])->name('buy-product.post');
});
