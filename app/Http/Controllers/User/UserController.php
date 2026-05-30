<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Posts\Post;
use App\Models\Tags\Tag;
use App\Models\Category\Category;

use App\Models\Posts\PostView;
use App\Models\User\User;

class UserController extends Controller
{
    public function index()
    {
    //     $posts = Post::with(['author'])->with('category')->withCount('views')->get();
    //     return response()->json($posts);
    }

    public function show($slug)
    {
        $userpost = User::where('slug', $slug)->with(['posts' => function ($query) {
    $query->withCount('views');
}])->firstOrfail();

        // $post = Post::with('author')->with('tags')->where('slug', $slug)->withCount('views')->firstOrFail();
        // $postviewincrement = PostView::updateOrcreate(['post_id' => $post->id]);
        // $postviewincrement->increment('views');
        return response()->json(
            $userpost
        );
    }
    public function relatedpost($slug)
    {
        // $post = Post::with('author')->with('category')->where('slug', $slug)->firstOrfail();
        // $relatedpost= Post::where('category_id', $post->category_id)->with('author')->get();
        // return response()->json([
        //     'relatedpost' => $relatedpost,
        //     'post' => $post,
        // ]);
    }

    
}
