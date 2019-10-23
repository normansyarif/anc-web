<?php

namespace App\Http\Controllers;

use App\Forum;
use App\ForumResponse;
use App\Tool;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class APIForumController extends Controller
{
  public function newForum(Request $request){
      $forum = new Forum();
      $forum->user_id = Tool::decrypt($request->token);
      $forum->judul = $request->judul;
      $forum->konten = $request->konten;

      if($forum->save()){
        $id = $forum->id;
        $file1 = $request->foto1;
        $file2 = $request->foto2;
        $file3 = $request->foto3;

        if($file1 != "") if(!Tool::storeImage($file1, public_path('forum/'), $id . "_1")) return Tool::json(array('status' => '0'));
        if($file2 != "") if(!Tool::storeImage($file2, public_path('forum/'), $id . "_2")) return Tool::json(array('status' => '0'));
        if($file3 != "") if(!Tool::storeImage($file3, public_path('forum/'), $id . "_3")) return Tool::json(array('status' => '0'));

        return Tool::json(array('status' => '1'));
      }
      else return Tool::json(array('status' => '0'));
  }

  public function imgFoto($id, $index){
    return redirect("/forum/".$id."_".$index.".png");
  }
}
