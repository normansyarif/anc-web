<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="{{ asset('vendors/hp/devices/assets/devices.min.css') }}" type="text/css">
  <link rel="stylesheet" href="{{ asset('vendors/hp/css/bs.css') }}">
  <link rel="stylesheet" type="text/css" href="{{ asset('vendors/hp/css/style.css') }}">
  <style type="text/css">
    body {
      background-color: #f9f9f9;
    }
    .marvel-device .screen {
      overflow-y: scroll;
      -webkit-overflow-scrolling: touch;
    }

    .preview {
      text-align: center;
      padding-top: 150px;
      padding-left: 30px;
      padding-right: 30px;
    }

    .preview .caption {
      font-size: 3em;
    }

    .container {
      margin-top: 10px;
    }
  </style>
</head>
<body>

  <div class="container">
    <div class="row">
      <div class="col-md-6 preview">
        <p class="caption">Preview</p>
        <p>@yield('judul')</p>
      </div>

      <div class="col-md-6">
        <div class="marvel-device iphone8plus black">
          <div class="top-bar"></div>
          <div class="sleep"></div>
          <div class="volume"></div>
          <div class="camera"></div>
          <div class="sensor"></div>
          <div class="speaker"></div>
          <div class="screen">

           <div class="card m-2 mb-3">
            <div class="card-body p-0">
              <h5 class="list-group-item active bg-info font-weight-bold">@yield('judul')</h5>
              <div class="container mt-3">

                @yield('konten')

              </div>
            </div>
          </div>

        </div>
        <div class="home"></div>
        <div class="bottom-bar"></div>
      </div>
    </div>
  </div>
</div>


</body>
</html>
