<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Posts\PostController;
use App\Http\Controllers\Tags\TagController;
use App\Http\Controllers\User\UserController;
use App\Http\Controllers\Categories\CategoryController;
use App\Http\Controllers\Comments\CommentController;

Route::get('/posts', [PostController::class, 'index']);

Route::get('/posts/{post:slug}', [PostController::class, 'show']);
Route::get('/posts/relatedpost/{post:slug}', [PostController::class, 'relatedpost']);
Route::get('/tags', [TagController::class, 'index']);
Route::get('/tag/{tag:slug}', [TagController::class, 'show']);
Route::get('/user/@{username}', [UserController::class, 'show']);
Route::get('/category/{category:slug}', [CategoryController::class, 'show']);
Route::get('/posts/comments/{post:slug}', [CommentController::class, 'relatedcomment']);
Route::post('/posts/comments/submitcomment/{post:slug}', [CommentController::class, 'submitcomment']);
Route::delete('/posts/comments/deletecomment/{comment}', [CommentController::class, 'deletecomment']);
Route::put('/posts/comments/updatecomment/{post:slug}', [CommentController::class, 'updatecomment']);
Route::get('/posts/comments/{comment}/replies', [CommentController::class, 'getReplies']);

Route::get('/search', [PostController::class, 'search']);
Route::get('/search/posts', [PostController::class, 'SearchPosts']);
Route::get('/search/categories', [PostController::class, 'SearchPosts']);
Route::get('/search/tags', [PostController::class, 'SearchPosts']);
