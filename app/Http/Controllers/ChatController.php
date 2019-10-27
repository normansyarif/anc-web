<?php

namespace App\Http\Controllers;

use App\Tool;
use App\User;
use App\Chat;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;

class ChatController extends Controller
{
    public function chats($token){
        $sender_id = Tool::decrypt($token);
        $chats = Chat::where('sender_id', $sender_id)->orWhere('recipient_id', $sender_id)->limit(30)->get();

        $items = array();
        foreach($chats as $e) {
            $store = array();
            $store['id'] = $e->id;
            $store['sender_id'] = $e->sender_id;
            $store['recipient_id'] = $e->recipient_id;
            $store['chat'] = $e->chat;
            $store['created_at'] = $e->created_at;

            if(File::exists(public_path()."/chat/".$e->id.".png")) $store['img'] = "1";
            else $store['img'] = "0";

            array_push($items, $store);
        }
        return $items;
    }

    public function newChat(Request $request){
      $chat = new Chat();
      $chat->sender_id = Tool::decrypt($request->token);
      $chat->recipient_id = $request->recipient_id;
      $chat->chat = $request->chat;

      if($chat->save()){
        $file = $request->img;
        if($file != "") Tool::storeImage($file, public_path('chat/'), $chat->id);
        return Tool::json(array('status' => '1', 'id' => $chat->id));
      } else return Tool::json(array('status' => '0'));
    }

    public function imgFoto($id){
      return redirect("/chat/".$id.".png");
    }

}
