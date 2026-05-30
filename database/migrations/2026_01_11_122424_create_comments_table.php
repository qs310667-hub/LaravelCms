<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('comments', function (Blueprint $table) {
            $table->id();
            $table->nullableMorphs('commentable');
            $table->nullableMorphs('commenter');
            $table->nullableMorphs('reply');

            $table->text('text');
            $table->boolean('is_approved')->default(true)->index();
            $table->string('author_type')->nullable();
            $table->unsignedBigInteger('author_id')->nullable();
            $table->timestamps();
        });

        Schema::table('comments', function (Blueprint $table) {
            $table->foreign('reply_id')->references('id')->on('comments')->cascadeOnDelete();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('comments');
    }
};
