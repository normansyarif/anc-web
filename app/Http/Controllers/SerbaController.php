<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\SerbaSerbi;

class SerbaController extends Controller
{
    public function serbaSerbi()
    {
    	$entries = SerbaSerbi::orderBy('updated_at', 'desc')->get();
        return view('serba.serba')->with('entries', $entries);
    }

    public function create() {
    	return view('serba.create_serba');
    }

    public function preview($id) {
    	$s = SerbaSerbi::find($id);
    	return view('serba.preview')->with('s', $s);
    }

    public function webview($id) {
        $s = SerbaSerbi::find($id);
        return view('serba.webview')->with('s', $s);
    }

    public function uploadImage(Request $request) {
        $CKEditorFuncNum = $request->input('CKEditorFuncNum');
        $re = $msg = '';

        if($request->hasFile('upload')) {
            $filenamewithextension = $request->file('upload')->getClientOriginalName();
            $filename = pathinfo($filenamewithextension, PATHINFO_FILENAME);
            $extension = $request->file('upload')->getClientOriginalExtension();

            if(in_array($extension, ["jpg", "png", "jpeg"])) {
                $filenametostore = $filename.'_'.time().'.'.$extension;
                $request->file('upload')->move(public_path('images'), $filenametostore);

                $url = asset('images/'.$filenametostore);
                $msg = 'Image successfully uploaded';
                $re = "<script>window.parent.CKEDITOR.tools.callFunction($CKEditorFuncNum, '$url', '$msg')</script>";
            }
        }
        @header('Content-type: text/html; charset=utf-8');
        echo $re;
    }

    public function post(Request $req) {
    	$s = new SerbaSerbi;
    	$s->judul = $req->input('title');
    	$s->konten = $req->input('text');
    	$s->save();
    	return redirect(route('serba'))->with('success', 'Berhasil menambah entri');
    }

    public function edit($id) {
    	$s = SerbaSerbi::find($id);
    	return view('serba.edit_serba')->with('s', $s);
    }

    public function update(Request $req, $id) {
    	$s = SerbaSerbi::find($id);
    	$s->judul = $req->input('title');
    	$s->konten = $req->input('text');
    	$s->save();
    	return redirect(route('serba'))->with('success', 'Berhasil mengubah entri');
    }

    public function delete($id) {
    	$s = SerbaSerbi::find($id);
    	$s->delete();
    	return redirect(route('serba'))->with('success', 'Berhasil menghapus entri');
    }

    // JSON
    public function jsonSerba() {
        $item = array();
        $entries = SerbaSerbi::orderBy('created_at', 'desc')->get();
        foreach($entries as $e) {
            $store = array();
            $store['id'] = $e->id;
            $store['title'] = $e->judul;
            $store['mhs'] = $e->mhs;
            array_push($item, $store);
        }
        return $item;
    }

}
