<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\FAQ;

class FAQController extends Controller
{
    public function faq()
    {
    	$f = FAQ::orderBy('created_at', 'desc')->get();
        return view('faq.faq')->with('entries', $f);
    }

    public function post(Request $req) {
    	$f = new FAQ;
    	$f->pertanyaan = $req->input('pertanyaan');
    	$f->jawaban = $req->input('jawaban');
    	$f->save();
    	return redirect(route('faq'))->with('success', 'Berhasil menambah pertanyaan');
    }

    public function update(Request $req) {
        $f = FAQ::find($req->input('id'));
        $f->pertanyaan = $req->input('pertanyaan');
        $f->jawaban = $req->input('jawaban');
        $f->save();
        return redirect(route('faq'))->with('success', 'Berhasil mengubah pertanyaan');
    }

    public function delete($id) {
        $f = FAQ::find($id);
        $f->delete();
        return redirect(route('faq'))->with('success', 'Berhasil menghapus pertanyaan');
    }

    //--------------------
    // Respon json
    //--------------------
    public function jsonFaq() {
        $pageno = $_GET['page'];
        $no_of_records_per_page = $_GET['per_page'];
        $offset = ($pageno-1) * $no_of_records_per_page;

        if(isset($_GET['search'])) {
            $q = $_GET['search'];
            $faq = FAQ::orderBy('created_at', 'desc')
                ->where('pertanyaan', 'like', '%' . $q . '%')
                ->orWhere('jawaban', 'like', '%' . $q . '%')
                ->skip($offset)
                ->take($no_of_records_per_page)
                ->get();
        }else{
            $faq = FAQ::orderBy('created_at', 'desc')
                ->skip($offset)
                ->take($no_of_records_per_page)
                ->get();
        }

        $item = array();
        foreach($faq as $f) {
            $store = array();
            $store['id'] = $f->id;
            $store['question'] = $f->pertanyaan;
            $store['answer'] = $f->jawaban;
            $store['created_at'] = $f->created_at;
            array_push($item, $store);
        }

        return $item;
    }

    public function jsonFaqItem($id) {
        $item = array();
        $faq = FAQ::find($id);
        $item['id'] = $faq->id;
        $item['question'] = $faq->pertanyaan;
        $item['jawaban'] = $faq->jawaban;
        $item['created_at'] = $faq->created_at;

        return $item;
    }
}
