<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth')->except(['viewImage', 'error']);
    }

    public function welcome()
    {
        return redirect()->route('serba');
    }

    public function viewImage(Request $req) {
        $url = $req->input('url');
        return view('imageview')->with('url', $url);
    }

    public function err($tipe) {
        if($tipe == 1) {
            return view('error')->with('msg', 'Maaf, website ini hanya dapat digunakan oleh admin');
        }else{
            return view('error')->with('msg', 'Something went wrong');
        }
    }
}
