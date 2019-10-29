<!DOCTYPE html>
<html>
<head>
	<title>Error</title>
</head>
<body>

	<div style="text-align: center; margin-top: 100px">
		<h1>{{ $msg }}</h1>

		<button style="font-size: 1.3em" 
		onclick="event.preventDefault();
		document.getElementById('logout-form').submit();
		">Kembali</button>
		<form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
			{{ csrf_field() }}
		</form>
	</div>

</body>
</html>
