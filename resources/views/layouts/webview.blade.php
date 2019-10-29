<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="{{ asset('vendors/hp/css/bs.css') }}">
  <link rel="stylesheet" type="text/css" href="{{ asset('vendors/hp/css/style.css') }}">
</head>
<body>

  <div class="card m-2 mb-3">
    <div class="card-body p-0 miku">
      <h5 class="list-group-item active bg-info font-weight-bold">@yield('judul')</h5>
      <div class="container mt-3">
        @yield('konten')
      </div>
    </div>
  </div>

</body>
</html>
