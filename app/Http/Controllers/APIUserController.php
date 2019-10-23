<?php

namespace App\Http\Controllers;

use App\Tool;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class APIUserController extends Controller
{
    public function register(Request $request){
        $alreadyUser = User::where('username', $request->username)->first();
        if(!empty($alreadyUser)) return Tool::json(array('status' => '2'));

        $user = new User();
        $user->name = $request->name;
        $user->username = $request->username;
        $user->password = Hash::make($request->password);
        $user->tipe = $request->tipe;
        $user->awal_hamil = $request->awal_hamil;

        if($user->save()) return Tool::json(array('status' => '1', 'token' => Tool::encrypt($user->id), 'user' => $user));
        else return Tool::json(array('status' => '0'));
    }

    public function login(Request $request){
      $user = User::where('username', $request->username)->first();
      if(!empty($user)){
        if(Hash::check($request->password, $user->password)){
          return Tool::json(array('token' => Tool::encrypt($user->id), 'user' => $user));
        }
      }

      return Tool::json(array('token' => '0'));
    }

    public function profile(Request $request){
      $id   = Tool::decrypt($request->token);
      $user = User::find($id);
      $user->name = $request->name;
      $user->awal_hamil = $request->awal_hamil;
      $user->tanggal_lahir = $request->tanggal_lahir;

      if($user->save()){
        $file = $request->foto;
        if($file != ""){
            if(!Tool::storeImage($file, public_path('profile/'), $id)) return Tool::json(array('status' => '0'));
        }

        return Tool::json(array('status' => '1', 'user' => $user));
      } else return Tool::json(array('status' => '0'));
    }

    public function imgProfile($token){
      $id = Tool::decrypt($token);
      return redirect("/profile/".$id.".png");
    }
}