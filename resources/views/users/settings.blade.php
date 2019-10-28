@extends('layouts.base')

@section('label', 'Pengaturan')

@section('content')

<div class="container-fluid">
  <!-- DataTales Example -->
  <div class="row">
    <div class="col-md-6 offset-md-3">
      <div class="card shadow mb-4">
        <div class="card-header py-3">
          <h6 class="m-0 font-weight-bold text-primary">Ubah Password</h6>
        </div>
        <div class="card-body">
          <form action="{{ route('changePassword') }}" method="post">
            @csrf
            <div class="mb-3">
              <label>Password baru</label>
              <input class="form-control" type="password" name="pass" required>
            </div>
            <div class="mb-3">
              <label>Ulangi password</label>
              <input class="form-control" type="password" name="pass2" required>
            </div>

            <div class="container">
              <div class="row">
                <div class="col text-center">
                  <button type="submit" class="btn btn-primary">Simpan</button>
                </div>
              </div>
            </div>
            
          </form>
        </div>
      </div>
    </div>
  </div>
</div>

@endsection

@section('modals')

@endsection
