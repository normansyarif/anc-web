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
        $chats = Chat::where('sender_id', $sender_id)->orWhere('recipient_id', $sender_id)->get();

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

    public function chatsDokter(Request $request){
        $sender_id = Tool::decrypt($request->token);
        $recipient_id = Tool::decrypt($request->recipient_id);
        $chats = Chat::where('recipient_id', $recipient_id)->orWhere('sender_id', $recipient_id)->get();

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

    public function chatList(){
        $all = Chat::selectRaw('sender_id')->where('sender_id', '!=', '1')->groupBy('sender_id')->orderBy('created_at', 'DESC')->get();
        $new = Chat::selectRaw('sender_id, count(id) AS count')->where('is_read', 0)->where('sender_id', '!=', '1')->groupBy('sender_id')->get();

        $items = array();
        foreach($all as $e) {
            $store = array();
            $store['sender_id'] = Tool::encrypt($e->sender_id);
            $store['name'] = $e->user->name;
            $store['count'] = 0;

            foreach ($new as $n) {
              if($e->sender_id == $n->sender_id) $store['count'] = $n->count;
            }

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
        return Tool::json(array('status' => '1', 'id' => $chat->id, 'sender_id' => $chat->sender_id));
      } else return Tool::json(array('status' => '0'));
    }

    public function newChatDokter(Request $request){
      $chat = new Chat();
      $chat->sender_id = Tool::decrypt($request->token);
      $chat->recipient_id = Tool::decrypt($request->recipient_id);
      $chat->chat = $request->chat;

      if($chat->save()){
        $file = $request->img;
        if($file != "") Tool::storeImage($file, public_path('chat/'), $chat->id);
        return Tool::json(array('status' => '1', 'id' => $chat->id, 'sender_id' => $chat->sender_id));
      } else return Tool::json(array('status' => '0'));
    }

    public function readDokter(Request $request){
      $chat = Chat::where('sender_id', Tool::decrypt($request->sender_id))->update(['is_read'=>'1']);
      return Tool::json(array('status' => '1'));
    }

    public function imgFoto($id){
      return response()->file(public_path()."/chat/".$id.".png");
    }

}
