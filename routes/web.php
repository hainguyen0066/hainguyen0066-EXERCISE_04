<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\MainController;
use App\Http\Controllers\Admin\CategoryController;
use App\Http\Controllers\Admin\ProductController;

Route::middleware(['web'])->group(function () {
    Route::prefix('admin')->group(function () {
        Route::get('/', [MainController::class, 'index'])->name('admin');
        #Category
        Route::prefix('categories')->group(function () {
            Route::get('add', [CategoryController::class, 'create']);
            Route::post('add', [CategoryController::class, 'store'])->name('product.store');
            Route::get('list', [CategoryController::class, 'index']);
            Route::get('edit/{category}', [CategoryController::class, 'show']);
            Route::post('edit/{category}', [CategoryController::class, 'update'])->name('product.update');;
            Route::DELETE('destroy', [CategoryController::class, 'destroy']);
        });

        #Product
        Route::prefix('products')->group(function () {
            Route::get('add', [ProductController::class, 'create']);
            Route::post('add', [ProductController::class, 'store'])->name('category.store');
            Route::get('list', [ProductController::class, 'index']);
            Route::get('edit/{product}', [ProductController::class, 'show']);
            Route::post('edit/{product}', [ProductController::class, 'update'])->name('category.update');
            Route::DELETE('destroy', [ProductController::class, 'destroy']);
        });
    });
});

Route::get('/', [App\Http\Controllers\MainController::class, 'index']);
Route::get('/search', [App\Http\Controllers\MainController::class, 'search'])->name('search');


