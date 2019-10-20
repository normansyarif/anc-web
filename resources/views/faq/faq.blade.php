@extends('layouts.base')

@section('label', 'Kelola FAQ')

@section('content')

<div class="container-fluid">
  <!-- DataTales Example -->
  <div class="card shadow mb-4">
    <div class="card-header py-3">
      <h6 class="m-0 font-weight-bold text-primary">Kelola FAQ</h6>
    </div>
    <div class="card-body">
      <div class="table-responsive">
        <button class="btn btn-primary float-right add-btn-table" data-toggle="modal" data-target="#newModal">Tambah</button>
        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
          <thead>
            <tr>
              <th>Pertanyaan</th>
              <th>Aksi</th>
            </tr>
          </thead>
          <tbody>

            @foreach($entries as $e)
            <tr>
              <td>{{ $e->pertanyaan }}</td>
              <td>
                <button onclick="
                $('#preview-pertanyaan').html('{{ $e->pertanyaan }}');
                $('#preview-jawaban').html('{{ $e->jawaban }}');
                " data-toggle="modal" data-target="#previewModal" class="btn btn-info btn-sm" title="Lihat jawaban"><i class="fa fa-eye"></i></button>
                
                <button onclick="
                $('#edit-id').val('{{ $e->id }}');
                $('#edit-pertanyaan').val('{{ $e->pertanyaan }}');
                $('#edit-jawaban').val('{{ $e->jawaban }}');
                " data-toggle="modal" data-target="#editModal" class="btn btn-success btn-sm" title="Edit"><i class="fa fa-edit"></i></button>

                <button onclick="
                if(confirm('Yakin?')) {
                  $(this).find('form').submit();
                }
                " class="btn btn-danger btn-sm" title="Hapus"><i class="fa fa-trash"></i>
                <form action="{{ route('delete_faq', $e->id) }}" method="post">
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

<!-- Add Modal -->
<div class="modal fade" id="newModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Tambah Pertanyaan</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <form method="post" action="{{ route('post_faq') }}">
        @csrf
        <!-- Modal body -->
        <div class="modal-body">
          <div>
            <label>Pertanyaan</label>
            <input type="text" name="pertanyaan" class="form-control">
          </div>
          <div>
            <label>Jawaban</label>
            <textarea class="form-control" name="jawaban"></textarea>
          </div>
        </div>

        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="submit" class="btn btn-primary">Simpan</button>
        </div>
      </form>

    </div>
  </div>
</div>

<!-- Previwe Modal -->
<div class="modal fade" id="previewModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Preview</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      <!-- Modal body -->
      <div class="modal-body">
        <p style="font-weight: bold" id="preview-pertanyaan"></p>
        <p id="preview-jawaban"></p>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button"  data-dismiss="modal" class="btn btn-primary">Tutup</button>
      </div>

    </div>
  </div>
</div>

<!-- Edit Modal -->
<div class="modal fade" id="editModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Edit</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <form method="post" action="{{ route('update_faq') }}">
        @csrf
        <!-- Modal body -->
        <div class="modal-body">
          <input id="edit-id" type="hidden" name="id">
          <div>
            <label>Pertanyaan</label>
            <input id="edit-pertanyaan" type="text" name="pertanyaan" class="form-control">
          </div>
          <div>
            <label>Jawaban</label>
            <textarea id="edit-jawaban" class="form-control" name="jawaban"></textarea>
          </div>
        </div>

        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="submit" class="btn btn-primary">Simpan</button>
        </div>
      </form>

    </div>
  </div>
</div>

@endsection
