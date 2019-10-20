<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ForumResponse extends Model
{
    protected $table = 'forum_responses';

    public function user() {
    	return $this->belongsTo('App\User', 'user_id');
    }
}
