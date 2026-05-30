<?php

namespace App\Http\Controllers\Comments;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Posts\Post;
use App\Models\Tags\Tag;
use App\Models\Category\Category;

use App\Models\Posts\PostView;
use App\Models\User\User;
use App\Models\Comment\Comment;
use Illuminate\Validation\Rule;


class CommentController extends Controller
{
    // public function index()
    // {
    //     $posts = Post::with(['author'])->with('category')->withCount('views')->get();
    //     return response()->json($posts);
    // }

    // public function show($slug)
    // {
    //     $post = Post::with('author')->with('tags')->where('slug', $slug)->withCount('views')->firstOrFail();
    //     $postviewincrement = PostView::create(['post_id' => $post->id]);
    //     $postviewincrement->increment('views');
    //     return response()->json(
    //         $post
    //     );
    // }
    public function relatedcomment($slug)
    {   
        $post = Post::where('slug', $slug)->firstOrfail();
    $comment = Comment::where('commentable_id', $post->id)
    ->whereNull('reply_id') // Cleaner way to check for null
    ->with(['user', 'replies.user'])
    ->orderBy('id', 'desc')
    ->where('is_approved', 1)
    ->paginate(5);
        return response()->json([
           $comment
           
        ]);
    }
    public function submitcomment($slug, Request $request){
        $post = Post::where('slug', $slug)->firstOrfail();
         $validatedData = $request->validate([
            'comment' => 'required|string|max:255',
            'reply_id' => [
                'nullable', // Allows submission without a reply_id (for top-level comments)
                'integer',
                Rule::exists('comments', 'id'), // Ensures reply_id exists in the comments table
            ],
             
        ]);
       Comment::create([
         'text' => $validatedData['comment'], // ← Save to "text" column
        'commentable_type' => 'App\Models\Posts\Post', // Should be full class path
        'commentable_id' => $post->id,
        'commenter_id' => auth()->id() ?? 1, // Changed from user_id to commenter_id
        'reply_id' => $validatedData['reply_id'] ?? null,
       ]);
    return response()->json(
           $validatedData);
    }
    
     public function deletecomment($id ,Request $request){
        $comment = Comment::findOrfail($id);
       
       $comment->delete();
    return response()->json(
           $comment);
    }
 public function updatecomment($slug, Request $request){
        $comment = Comment::findOrfail($request->reply_id);
         $validatedData = $request->validate([
            'comment' => 'required|string|max:255',
            'reply_id' => [
                'nullable', // Allows submission without a reply_id (for top-level comments)
                'integer',
                Rule::exists('comments', 'id'), // Ensures reply_id exists in the comments table
            ],
             
        ]);
       $comment->update([
        'text' => $request->comment, // ← Save to "text" column

       ]);
    return response()->json(
           $request);
    }
public function getReplies($commentId)
{
    $replies = Comment::where('reply_id', $commentId)
        ->with('user')
        ->orderBy('id', 'desc')
        ->withCount('replies')
        ->paginate(5);
    
    return response()->json($replies);
}
}
