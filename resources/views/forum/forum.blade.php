@extends('layouts.base')

@section('label', 'Kelola Forum')

@section('content')

<div class="container-fluid">
  <!-- DataTales Example -->
  <div class="card shadow mb-4">
    <div class="card-header py-3">
      <h6 class="m-0 font-weight-bold text-primary">Kelola Forum</h6>
    </div>
    <div class="card-body">
      <div class="table-responsive">
        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
          <thead>
            <tr>
              <th>Pengguna</th>
              <th>Judul</th>
              <th>Aksi</th>
            </tr>
          </thead>
          <tbody>

            @foreach($entries as $e)
            <tr>
              <td>{{ $e->user->name }}</td>
              <td>{{ $e->judul }}</td>
              <td>
                <button onclick="
                $('#modal-content').html('{{ $e->konten }}')
                " data-toggle="modal" data-target="#preview-modal" class="btn btn-info btn-sm" title="Preview"><i class="fa fa-eye"></i></button>
                <button onclick="
                if(confirm('Yakin?')) {
                  $(this).find('form').submit();
                }
                " class="btn btn-danger btn-sm" title="Hapus"><i class="fa fa-trash"></i>
                <form method="post" action="{{ route('delete_forum', $e->id) }}">
                  @csrf
                </form>
                </button>
              </td>
            </tr>
            @endforeach
            
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>

@endsection

@section('modals')

<div class="modal fade" id="preview-modal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Preview</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body" id="modal-content"></div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Tutup</button>
      </div>

    </div>
  </div>
</div>

@endsection
