<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\User;
use App\Forum;
use App\ForumResponse;
use App\Chat;

class UserController extends Controller
{
    public function users()
    {
    	$users = User::orderBy('name', 'desc')->get();
        return view('users.users')->with('users', $users);
    }

    public function settings() {
    	return view('users.settings');
    }

    public function changePassword(Request $req) {
    	if($req->input('pass') == $req->input('pass2')) {
    		$u = User::find(auth()->user()->id);
    		$u->password = Hash::make($req->input('pass'));
    		$u->save();
    		return redirect(route('settings'))->with('success', 'Berhasil mengubah password');
    	}else{
    		return redirect(route('settings'))->with('error', 'Password tidak cocok');
    	}
    }

    public function delete($id) {
    	$u = User::find($id);
    	$u->delete();

    	// Delete related forums
    	$f = Forum::where('user_id', $id);
    	$f->delete();
    	$fr = ForumResponse::where('user_id', $id);
    	$fr->delete();

    	// Delete related chat
    	$c = Chat::where('sender_id', $id);
    	$c->delete();
    	$c = Chat::where('recipient_id', $id);
    	$c->delete();

    	return redirect(route('users'))->with('success', 'Berhasil menghapus pengguna');
    }
}
