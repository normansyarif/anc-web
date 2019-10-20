@extends('layouts.base')

@section('label', 'Serba-serbi Kehamilan')

@section('content')

<div class="container-fluid">
  <!-- DataTales Example -->
  <div class="card shadow mb-4">
    <div class="card-header py-3">
      <h6 class="m-0 font-weight-bold text-primary">Edit</h6>
    </div>
    <div class="card-body">

      <form method="POST" action="{{ route('update_serba', $s->id) }}" enctype="multipart/form-data" class="add-quest-form">
        @csrf

        <div class="quest-form">
          <label>Judul</label>
          <input value="{{ $s->judul }}" type="text" name="title" placeholder="Judul" class="form-control" required>
        </div>

        <div class="quest-form">
          <label>Konten</label>
          <textarea class="ckeditor" name="text" id="text" placeholder="Konten">{!! $s->konten !!}</textarea>
        </div>

        <div class="quest-form">
          <input type="submit" class="btn btn-primary" value="Simpan">
        </div>
      </form>

    </div>
  </div>
</div>

@endsection

@section('scripts')
<script src="{{ asset('vendors/unisharp/laravel-ckeditor/ckeditor.js') }}"></script>

<script type="text/javascript">
  CKEDITOR.replace( 'text', {
    filebrowserUploadUrl: "{{route('upload_image', ['_token' => csrf_token() ])}}",
    filebrowserUploadMethod: 'form'
  });
</script>
@endsection
