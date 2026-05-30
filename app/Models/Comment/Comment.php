<?php

namespace App\Models\Comment;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Posts\Post;
use App\Models\User\User;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Kirschbaum\Commentions\Contracts\Commentable;
use Kirschbaum\Commentions\HasComments;
class Comment extends Model
{
    /** @use HasFactory<\Database\Factories\CategoryFactory> */
    use HasFactory, HasComments;
    protected $guarded = [];
    public function user(){
             return $this->belongsTo(User::class, 'commenter_id');

    }
    public function replies(){
             return $this->HasMany(Comment::class, 'reply_id')->with(['user', 'replies']);
           
    }

}
