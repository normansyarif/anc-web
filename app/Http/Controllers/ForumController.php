<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Forum;
use App\ForumResponse;

class ForumController extends Controller
{
    public function forum()
    {
    	$entries = Forum::orderBy('created_at', 'desc')->get();
        return view('forum.forum')->with('entries', $entries);
    }

    public function delete($id) {
    	$f = Forum::find($id);
    	$f->delete();

    	$r = ForumResponse::where('forum_id', $id);
    	$r->delete();

    	return redirect(route('forum'))->with('success', 'Berhasil menghapus forum');
    }

    public function jsonForum() {
        $item = array();
        $forum = Forum::orderBy('created_at', 'desc')->get();
        foreach($forum as $f) {
            $store = array();
            $store['id'] = $f->id;
            $store['user_name'] = $f->user->name;
            $store['avatar'] = $f->user->photo;
            $store['title'] = $f->judul;
            $store['created_at'] = date("d-m-Y", strtotime($f->created_at));
            $store['response_count'] = count($f->responses);
            array_push($item, $store);
        }
        return $item;
    }

    public function jsonForumResponses($id) {
        $item = array();
        $res = ForumResponse::where('forum_id', $id)->get();
        foreach($res as $r) {
            $store = array();
            $store['user_name'] = $r->user->name;
            $store['avatar'] = $r->user->photo;
            $store['response'] = $r->respon;
            $store['created_at'] = date("d-m-Y", strtotime($r->created_at));
            array_push($item, $store);
        }
        return $item;
    }
}
