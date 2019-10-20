<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Forum extends Model
{
    protected $table = 'forum';

    public function user() {
    	return $this->belongsTo('App\User', 'user_id');
    }

    public function responses() {
    	return $this->hasMany('App\ForumResponse', 'forum_id');
    }
}
