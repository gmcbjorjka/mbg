<!DOCTYPE html>
<html>

<head>

<style>

body{

font-family: sans-serif;

font-size:12px;

}


.header{

text-align:center;

margin-bottom:20px;

}


h2{

margin-bottom:5px;

}


table{

width:100%;

border-collapse:collapse;

}


th{

background:#eeeeee;

padding:8px;

border:1px solid #999;

}


td{

padding:8px;

border:1px solid #ccc;

}


</style>

</head>


<body>



<div class="header">


<h2>

{{ $setting?->name ?? 'SPPG MBG' }}

</h2>



<div>

{{ $setting?->address ?? '-' }}

</div>



<div>

Posyandu :
{{ $setting?->posyandu_name ?? '-' }}

</div>



<h3>

REPORT {{ $jenis }}

</h3>



<div>

Tanggal Report :
{{ $tanggal }}

</div>



</div>





<table>


<tr>

@foreach(array_keys($data[0] ?? []) as $header)

<th>

{{ strtoupper(str_replace('_',' ',$header)) }}

</th>

@endforeach


</tr>





@foreach($data as $row)


<tr>


@foreach($row as $value)


<td>

{{ $value }}

</td>


@endforeach


</tr>


@endforeach



</table>



</body>

</html>