<?php

namespace App\Models\User;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Spatie\Permission\Traits\HasRoles; // Import the HasRoles trait
use Filament\Panel;
use Filament\Models\Contracts\FilamentUser;
use BezhanSalleh\FilamentShield\Traits\HasPanelShield;
use App\Models\Posts\Post;
use RalphJSmit\Laravel\SEO\Support\HasSEO;
use LakM\Commenter\Concerns\Commenter;
use LakM\Commenter\Contracts\CommenterContract;
use Kirschbaum\Commentions\Contracts\Commenter as kcommenter;
class User extends Authenticatable implements kcommenter
{
    /** @use HasFactory<\Database\Factories\UserFactory> */
    use HasFactory, Notifiable, HasRoles, HasPanelShield, HasSEO, Commenter;

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
       protected $guarded = [];


    /**
     * The attributes that should be hidden for serialization.
     *
     * @var list<string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * Get the attributes that should be cast.
     *
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'password' => 'hashed',
            'is_admin' => 'boolean',
        ];
    }
    public function canAccessPanel(Panel $panel): bool
    {
            return $this->is_admin === true;
       

    }
    public function posts()
    {
        return $this->hasMany(Post::class, 'user_id');

    }

  
}
