<?php
use Illuminate\Support\Facades\Route;
use Illuminate\Http\Request;
use App\Http\Middleware\checkroute; 
use App\Http\Controllers\Posts\PostController;
use App\Http\Controllers\Tags\TagController;
use App\Http\Controllers\Categories\CategoryController;
Route::get('/', function (Request $request) {
 
    return view('posts');
})->name('home');



// Route::get('/@{slug}', function () {
//     return view('user');
// });
Route::get('/posts/{slug}', [PostController::class, 'show']);
Route::get('/tag/{slug}', [TagController::class, 'show']);
Route::get('/category/{slug}', [CategoryController::class, 'show']);

Route::prefix('/search')->middleware('checkroute')->group(function () {
Route::get('/', function () {
    return view('postssearch');
});
Route::get('/categories', function () {
    return view('categoriessearch');
});
Route::get('/tags', function () {
    return view('tagsearch');
});
});



