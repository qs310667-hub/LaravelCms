<?php

namespace App\Models\Posts;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
    use App\Models\Category\Category;
use App\Models\Tags\Tag;
use RalphJSmit\Laravel\SEO\Support\HasSEO;
use App\Models\User\User;
use App\Models\Posts\PostView;
use App\Models\Comment\Comment;
use LakM\Commenter\Concerns\Commentable;
use LakM\Commenter\Contracts\CommentableContract;
use Kirschbaum\Commentions\HasComments;
use Kirschbaum\Commentions\Contracts\Commentable as kcommentable;
class Post extends Model
{
    /** @use HasFactory<\Database\Factories\PostFactory> */
    use HasFactory, HasSEO, Commentable, HasComments;
    protected $guarded = [];

// ...

public function category()
{
    return $this->belongsTo(Category::class, 'category_id');
}

public function tags()
{
    return $this->belongsToMany(Tag::class, 'post_tag');
}

public function author()
{
    return $this->belongsTo(User::class, 'user_id');
}
   public function views()
    {
        return $this->hasMany(PostView::class);
    }
    public function comments()
{
    return $this->hasMany(Comment::class, 'commentable_id');
}
}
