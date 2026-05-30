<?php

namespace App\Models\Tags;

use Illuminate\Database\Eloquent\Model;
use App\Models\Posts\Post;
use RalphJSmit\Laravel\SEO\Support\HasSEO;

class Tag extends Model
{
    use  HasSEO;

    protected $guarded = [];

    public function posts()
{
    return $this->belongsToMany(Post::class, 'post_tag');
}

}
