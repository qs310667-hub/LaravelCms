<?php

namespace App\Http\Controllers\Tags;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Tags\Tag;
use App\Models\Posts\PostView;
use Illuminate\Support\Str;

class TagController extends Controller
{
    public function index()
    {
        $tags = Tag::paginate(10);
        return response()->json($tags);
    }

    public function show($slug)
    {
       // First, get the tag
    $tag = Tag::where('slug', $slug)->with('seo')->firstOrFail();
    
    // Then, paginate its posts
    $posts = $tag->posts()
        ->with('author')
        ->withCount('views')
        ->withCount(['comments as top_level_comments_count' => function ($query) {
        $query->whereNull('reply_id');
    }])
        ->latest()
        ->where('status', 'published') // Usually you want latest posts first
        ->paginate(10); // 10 posts per page
         $posts->getCollection()->transform(function ($post) {
         $post->body = Str::limit($post->body, 150, '...'); // Limit to 150 chars
         return $post;
         });
    
    // Return both tag info and paginated posts
              if (request()->wantsJson() || request()->is('api/*')) {
          return response()->json([
        'tag' => $tag,
        'posts' => $posts
    ]);
    }
        return view('tags', compact('tag'));
  
    }
}
