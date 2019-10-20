@extends('layouts.base')

@section('label', 'Serba-serbi Kehamilan')

@section('content')

<div class="container-fluid">
  <!-- DataTales Example -->
  <div class="card shadow mb-4">
    <div class="card-header py-3">
      <h6 class="m-0 font-weight-bold text-primary">Serba-serbi Kehamilan</h6>
    </div>
    <div class="card-body">
      <div class="table-responsive">
        <a href="{{ route('create_serba') }}" class="btn btn-primary float-right add-btn-table" >Tambah</a>
        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
          <thead>
            <tr>
              <th>Judul</th>
              <th>Aksi</th>
            </tr>
          </thead>
          <tbody>
            
            @foreach($entries as $e)
            <tr>
              <td>{{ $e->judul }}</td>
              <td>
                <a target="__blank" href="{{ route('preview_serba', $e->id) }}" class="btn btn-info btn-sm" title="Preview"><i class="fa fa-eye"></i></a>
                <a href="{{ route('edit_serba', $e->id) }}" class="btn btn-success btn-sm" title="Edit"><i class="fa fa-edit"></i></a>
                <button onclick="
                if(confirm('Yakin?')) {
                  $(this).find('form').submit();
                }
                " class="btn btn-danger btn-sm" title="Hapus"><i class="fa fa-trash"></i>
                <form method="post" action="{{ route('delete_serba', $e->id) }}">
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

@endsection
