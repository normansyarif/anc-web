@extends('layouts.base')

@section('label', 'Kelola Pengguna')

@section('content')

<div class="container-fluid">
  <!-- DataTales Example -->
  <div class="card shadow mb-4">
    <div class="card-header py-3">
      <h6 class="m-0 font-weight-bold text-primary">Kelola Pengguna</h6>
    </div>
    <div class="card-body">
      <div class="table-responsive">
        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
          <thead>
            <tr>
              <th>Nama</th>
              <th>Tipe</th>
              <th>Aksi</th>
            </tr>
          </thead>
          <tbody>
            
            @foreach($users as $user)
            <tr>
              <td>{{ $user->name }}</td>

              @if($user->tipe == 1)
              <td>Ibu Hamil</td>
              @elseif($user->tipe == 2)
              <td>Mahasiswa</td>
              @elseif($user->tipe == 3)
              <td>Dokter</td>
              @elseif($user->tipe == 4)
              <td>Administrator</td>
              @else
              <td>-</td>
              @endif

              @if($user->tipe == 1 || $user->tipe == 2)
              <td>
                <button onclick="
                if(confirm('Yakin?')) {
                  $(this).find('form').submit();
                }
                " class="btn btn-danger btn-sm" title="Hapus">Hapus
                <form method="post" action="{{ route('user.delete', $user->id) }}">
                  @csrf
                </form>
              </button>
              </td>
              @else
              <td></td>
              @endif
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


@section('scripts')

<script type="text/javascript">
  $(document).ready(function() {
    $('#dataTable').DataTable( {
      "order": [[ 0, "asc" ]]
    } );
  } );
</script>

@endsection
