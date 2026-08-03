<!DOCTYPE html>
<html lang="id">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">


<style>

body {

    font-family: DejaVu Sans, sans-serif;

    font-size: 11px;

    color:#111;

}


/* =====================
   KOP SURAT
===================== */

.header {

    text-align:center;

    border-bottom:2px solid #000;

    padding-bottom:10px;

    margin-bottom:15px;

}


.header h2 {

    margin:0;

    font-size:18px;

    font-weight:bold;

}


.header p {

    margin:3px 0;

    font-size:11px;

}





/* =====================
   INFORMASI
===================== */


.info {

    width:100%;

    margin-bottom:15px;

    border-collapse:collapse;

}


.info td {

    padding:4px;

}





/* =====================
   SUMMARY
===================== */


.summary-wrapper {

    width:100%;

    margin-bottom:15px;

}



.summary-card {

    width:30%;

    display:inline-block;

    text-align:center;

    border:1px solid #999;

    padding:8px;

    margin-right:5px;

}



.summary-label {

    font-size:10px;

    color:#444;

}



.summary-value {

    margin-top:5px;

    font-size:16px;

    font-weight:bold;

}





/* =====================
   TABLE
===================== */


table.data {

    width:100%;

    border-collapse:collapse;

    margin-top:10px;

}



table.data th {


    background:#e5e7eb;

    border:1px solid #999;

    padding:5px;

    text-align:center;

    font-size:10px;

}



table.data td {


    border:1px solid #999;

    padding:4px;

    font-size:10px;

    word-wrap:break-word;

}





.table-small th,
.table-small td {

    font-size:8px !important;

    padding:3px !important;

}



.table-medium th,
.table-medium td {

    font-size:9px !important;

    padding:4px !important;

}



.table-large th,
.table-large td {

    font-size:10px !important;

    padding:5px !important;

}



.group-row {

    background:#e5e7eb;

    font-weight:bold;

}



.center {

    text-align:center;

}





tr {

    page-break-inside:avoid;

}



</style>

</head>


<body>



{{-- =====================
KOP SPPG
===================== --}}


<div class="header">


<h2>

{{ optional($sppg)->name ?? 'SPPG' }}

</h2>



<p>

{{ optional($sppg)->address ?? '-' }}

</p>



<p>

Posyandu

{{ optional($sppg)->posyandu_name ?? '-' }}

</p>


</div>







{{-- =====================
INFORMASI FILTER
===================== --}}



<table class="info">


<tr>

<td width="25%">

Jenis Laporan

</td>


<td>


@php

$jenisLaporan=[

    'mobile_user'=>'User Mobile',

    'schedule'=>'Jadwal MBG',

    'verification'=>'Verifikasi Penerimaan',

];


@endphp


{{

$jenisLaporan[$meta['filter_type'] ?? '']

??

'-'

}}


</td>


</tr>





<tr>


<td>

Periode Data

</td>


<td>


@if(

($meta['all_data'] ?? false)

)


Semua Data



@elseif(

($meta['filter_type'] ?? '') === 'verification'

)



{{

\Carbon\Carbon::parse(

$meta['start_date']

)

->startOfWeek(
    \Carbon\Carbon::MONDAY
)

->format('d-m-Y')

}}


s/d


{{

\Carbon\Carbon::parse(

$meta['start_date']

)

->endOfWeek(
    \Carbon\Carbon::FRIDAY
)

->format('d-m-Y')

}}



@elseif(

!empty($meta['start_date'])

&&

!empty($meta['end_date'])

)



{{

\Carbon\Carbon::parse(

$meta['start_date']

)

->format('d-m-Y')

}}


s/d


{{

\Carbon\Carbon::parse(

$meta['end_date']

)

->format('d-m-Y')

}}



@else

-

@endif


</td>


</tr>






<tr>

<td>

Tanggal Cetak

</td>


<td>

{{ now()->format('d-m-Y') }}

</td>


</tr>



</table>








{{-- =====================
SUMMARY
===================== --}}


@if(count($summary))


<div class="summary-wrapper">


@foreach($summary as $key=>$value)



<div class="summary-card">


<div class="summary-label">


{{

match($key){


'total'
=>
'Total Data',


'pregnant'
=>
'Ibu Hamil',


'toddler'
=>
'Orang Tua Balita',


'diterima'
=>
'Diterima',


'belum_diterima'
=>
'Belum Diterima',


default
=>
ucwords(
str_replace('_',' ',$key)
)


}

}}


</div>




<div class="summary-value">


{{ number_format($value) }}


</div>


</div>



@endforeach


</div>


@endif








{{-- =====================
TABLE DATA
===================== --}}



@php


$columnCount=count($columns);



$tableSize=match(true){


$columnCount>12
=>
'table-small',


$columnCount>8
=>
'table-medium',


default
=>
'table-large',


};



$no=1;


@endphp







<table class="data {{ $tableSize }}">



<thead>


<tr>


<th width="5%">

No

</th>



@foreach($columns as $label)


<th>

{{ $label }}

</th>


@endforeach


</tr>


</thead>







<tbody>



@forelse($data as $row)





{{-- GROUP MINGGU VERIFIKASI --}}


@if(isset($row['group']))


<tr class="group-row">


<td colspan="{{ count($columns)+1 }}">


{{ $row['group'] }}


</td>


</tr>



@continue


@endif





<tr>



<td class="center">


{{ $no++ }}


</td>





@foreach($columns as $key=>$label)



<td>


{{ $row[$key] ?? '-' }}


</td>



@endforeach




</tr>





@empty



<tr>


<td

colspan="{{ count($columns)+1 }}"

class="center"

>


Tidak ada data


</td>


</tr>



@endforelse




</tbody>


</table>





</body>

</html>