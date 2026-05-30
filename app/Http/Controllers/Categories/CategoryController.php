<?php

namespace App\Http\Controllers\Categories;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Category\Category;
use App\Models\PostView;
use Illuminate\Support\Str;

class CategoryController extends Controller
{
    public function index()
    {
        $categories = Category::all();
        return response()->json($categories);
    }

    public function show($slug)
    {
        $category = Category::with('seo')->where('slug', $slug)->firstOrFail();
        $posts = $category->posts()
        ->with('author')
        ->withCount('views')
        ->withCount(['comments as top_level_comments_count' => function ($query) {
        $query->whereNull('reply_id');
        }])
        ->latest() // Usually you want latest posts first
        ->where('status', 'published')
        ->paginate(10);
         $posts->getCollection()->transform(function ($post) {
         $post->body = Str::limit($post->body, 150, '...'); // Limit to 150 chars
         return $post;
         });
              if (request()->wantsJson() || request()->is('api/*')) {
         return response()->json([
            'category' => $category,
            'posts' => $posts,
        ]);
    }
        return view('category', compact('category'));
        
    }
}
