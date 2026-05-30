<?php

namespace App\Http\Controllers\Posts;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Posts\Post;
use App\Models\Tags\Tag;
use App\Models\Category\Category;
use Illuminate\Support\Str;
use App\Models\Posts\PostView;
use App\Models\User\User;


class PostController extends Controller
{
    public function index(Request $request)
    {
       $query = Post::with(['author', 'category', 'tags'])->withCount('views')->withCount(['comments as top_level_comments_count' => function ($query) {
        $query->whereNull('reply_id');
    }])->where('status', 'published');

    // Check if the URL has ?feed=featured
    if ($request->query('feed') === 'featured') {
        $query->orderBy('views_count', 'desc');
    } else {
        // Default ordering (e.g., newest first)
        $query->orderBy('created_at', 'desc');
    }
   

    $posts = $query->paginate(5);
     $posts->getCollection()->transform(function ($post) {
        $post->body = Str::limit($post->body, 150, '...'); // Limit to 150 chars
        return $post;
    });
    return response()->json($posts);

    }

    public function show($slug)
    {
        $post = Post::with('author')->with('tags')->with('comments')->with('seo')->where([['slug', $slug], ['status', 'published']])->withCount('views')->withCount(['comments as top_level_comments_count' => function ($query) {
        $query->whereNull('reply_id');
    }])->firstOrFail();
        $postviewincrement = PostView::create(['post_id' => $post->id]);
        $postviewincrement->increment('views');
          if (request()->wantsJson() || request()->is('api/*')) {
        return response()->json($post);
    }
        return view('postsingle', compact('post'));
    }
    
    public function relatedpost($slug)
    {
        $post = Post::with('author')->with('category')->where([['slug', $slug], ['status', 'published']])->firstOrfail();
        $relatedpost= Post::where(['category_id', $post->category_id], ['status', 'published'])->withCount('views')->withCount(['comments as top_level_comments_count' => function ($query) {
        $query->whereNull('reply_id');
    }])->where('id', '!=', $post->id)->with('author')->limit(4)->get();
        return response()->json([
            'relatedpost' => $relatedpost,
            'post' => $post,
        ]);
    }
        public function search(Request $request)
    {
        $query = $request->get('q');
        
        // Return empty results if query is too short
        if (strlen($query) < 1) {
            return response()->json([
                'posts' => [],
                'tags' => []
            ]);
        }

        // Search in posts
        $posts = Post::where('title', 'LIKE', "%{$query}%")
                    ->orWhere('body', 'LIKE', "%{$query}%")
                    ->orWhere('slug', 'LIKE', "%{$query}%")->limit(3)->get();
                   

        // Search in tags
        $tags = Tag::where('name', 'LIKE', "%{$query}%")
                     ->orWhere('slug', 'LIKE', "%{$query}%")
                    ->limit(3)
                    ->get();
        $categories = Category::where('name', 'LIKE', "%{$query}%")
                    ->orWhere('slug', 'LIKE', "%{$query}%")
                    ->limit(3)
                    ->get();

        return response()->json([
            'posts' => $posts,
            'tags' => $tags,
            'categories' => $categories

        ]);
    }
    public function searchPosts(Request $request){
   
             $query = $request->get('q');
        
        // Return empty results if query is too short
        if (strlen($query) < 1) {
            return response()->json([
                'posts' => [],
                'tags' => []
            ]);
        }

        // Search in posts
        $posts = Post::where('title', 'LIKE', "%{$query}%")
                    ->orWhere('body', 'LIKE', "%{$query}%")
                    ->orWhere('slug', 'LIKE', "%{$query}%")->with(['author'])->with('category')->withCount('views')
                    ->paginate(5);
                   

        // Search in tags
        $tags = Tag::where('name', 'LIKE', "%{$query}%")
                     ->orWhere('slug', 'LIKE', "%{$query}%")
                    ->paginate(5)
                    ;
        $categories = Category::where('name', 'LIKE', "%{$query}%")
                    ->orWhere('slug', 'LIKE', "%{$query}%")
                    ->paginate(5)
                    ;

        return response()->json([
            'posts' => $posts,
            'tags' => $tags,
            'categories' => $categories

        ]);
    }
    
}
