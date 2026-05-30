<?php

namespace App\Models\Category;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Posts\Post;
use RalphJSmit\Laravel\SEO\Support\HasSEO;

use Illuminate\Database\Eloquent\Relations\HasMany;

class Category extends Model
{
    /** @use HasFactory<\Database\Factories\CategoryFactory> */
    use HasFactory, HasSEO;
    protected $guarded = [];
    public function posts()
{
    return $this->hasMany(Post::class);
}


}
