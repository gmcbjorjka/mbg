<?php

namespace App\Exports;


use Maatwebsite\Excel\Concerns\FromArray;
use Maatwebsite\Excel\Concerns\WithStyles;
use Maatwebsite\Excel\Concerns\WithColumnFormatting;


use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;
use PhpOffice\PhpSpreadsheet\Style\Alignment;
use PhpOffice\PhpSpreadsheet\Style\Border;
use PhpOffice\PhpSpreadsheet\Style\Fill;



class ReportExport implements
    FromArray,
    WithStyles,
    WithColumnFormatting
{


    protected array $data;

    protected $setting;

    protected string $jenis;

    protected string $tanggal;

    protected array $summary;





    public function __construct(

        array $data,

        $setting,

        string $jenis,

        string $tanggal,

        array $summary = []

    ) {


        $this->data = $data;

        $this->setting = $setting;

        $this->jenis = $jenis;

        $this->tanggal = $tanggal;

        $this->summary = $summary;

    }








    public function array(): array
    {


        $rows = [];





        /*
        |--------------------------------------------------------------------------
        | KOP SPPG
        |--------------------------------------------------------------------------
        */


        $rows[] = [

            strtoupper(

                $this->setting?->name

                ??

                'SPPG MBG'

            )

        ];





        $rows[] = [

            $this->setting?->address

            ??

            '-'

        ];









        /*
        |--------------------------------------------------------------------------
        | JARAK KOP
        |--------------------------------------------------------------------------
        */


        $rows[] = [''];










        /*
        |--------------------------------------------------------------------------
        | INFORMASI REPORT
        |--------------------------------------------------------------------------
        */


        $rows[] = [

            'POSYANDU',

            ':',

            $this->setting?->posyandu_name

            ??

            '-'

        ];





        $rows[] = [

            'JENIS REPORT',

            ':',

            strtoupper(

                $this->jenis

            )

        ];





        $rows[] = [

            'TANGGAL REPORT',

            ':',

            $this->tanggal

        ];










        /*
        |--------------------------------------------------------------------------
        | JARAK SEBELUM KESIMPULAN
        |--------------------------------------------------------------------------
        */


        $rows[] = [''];

        $rows[] = [''];

        $rows[] = [''];







        /*
        |--------------------------------------------------------------------------
        | KESIMPULAN
        |--------------------------------------------------------------------------
        */


        $rows[] = [

            'KESIMPULAN'

        ];



        $rows[] = [

            'JUMLAH DATA',

            ':',

            $this->summary['total'] ?? 0

        ];



        $rows[] = [

            'JUMLAH IBU HAMIL',

            ':',

            $this->summary['pregnant'] ?? 0

        ];



        $rows[] = [

            'JUMLAH IBU BALITA',

            ':',

            $this->summary['toddler'] ?? 0

        ];






        /*
        |--------------------------------------------------------------------------
        | JARAK SEBELUM TABLE
        |--------------------------------------------------------------------------
        */


        $rows[] = [''];

        $rows[] = [''];

        $rows[] = [''];
        /*
        |--------------------------------------------------------------------------
        | HEADER TABLE
        |--------------------------------------------------------------------------
        */


        if (count($this->data)) {



            $headers = array_filter(


                array_keys(

                    $this->data[0]

                ),



                fn($key) =>

                $key !== 'beneficiary_key'


            );







            $rows[] = array_merge(


                [

                    'NO'

                ],




                array_map(



                    function ($header) {



                        return match ($header) {



                            'name'
                            =>
                            'NAMA PENERIMA',




                            'email'
                            =>
                            'EMAIL',




                            'phone'
                            =>
                            'NOMOR HP',




                            'nik'
                            =>
                            'NIK PENERIMA',




                            'gender'
                            =>
                            'JENIS KELAMIN PENERIMA',




                            'birth_date'
                            =>
                            'TANGGAL LAHIR PENERIMA',




                            'beneficiary_type'
                            =>
                            'JENIS PENERIMA',




                            'child_name'
                            =>
                            'NAMA ANAK',




                            'child_nik'
                            =>
                            'NIK ANAK',




                            'child_gender'
                            =>
                            'JENIS KELAMIN ANAK',




                            'child_birth_date'
                            =>
                            'TANGGAL LAHIR ANAK',




                            'age_information'
                            =>
                            'USIA ANAK',




                            'address'
                            =>
                            'ALAMAT',




                            'status'
                            =>
                            'STATUS',




                            'created_at'
                            =>
                            'TANGGAL DAFTAR',




                            default
                            =>
                            strtoupper(

                                str_replace(

                                    '_',

                                    ' ',

                                    $header

                                )

                            ),


                        };



                    },


                    $headers


                )


            );









            /*
            |--------------------------------------------------------------------------
            | DATA TABLE
            |--------------------------------------------------------------------------
            */


            $no = 1;





            foreach ($this->data as $item) {



                $row = [


                    $no++


                ];







                foreach ($item as $key=>$value) {




                    /*
                    |--------------------------------------------------------------------------
                    | SKIP INTERNAL FIELD
                    |--------------------------------------------------------------------------
                    */


                    if (

                        $key === 'beneficiary_key'

                    ) {


                        continue;


                    }







                    /*
                    |--------------------------------------------------------------------------
                    | FORMAT HP / NIK
                    |--------------------------------------------------------------------------
                    */


                    if (

                        in_array(

                            $key,

                            [

                                'phone',

                                'nik',

                                'child_nik',

                            ]

                        )

                    ) {



                        $value = filled($value)


                            ?


                            "'".$value


                            :


                            '-';



                    }







                    $row[] = $value;



                }






                $rows[] = $row;



            }




        }







        return $rows;



    }

    



    /*
    |--------------------------------------------------------------------------
    | STYLE EXCEL
    |--------------------------------------------------------------------------
    */


    public function styles(
        Worksheet $sheet
    )
    {


        $lastColumn =

            $sheet->getHighestColumn();




        $lastRow =

            $sheet->getHighestRow();









        /*
        |--------------------------------------------------------------------------
        | MERGE KOP
        |--------------------------------------------------------------------------
        */


        $sheet->mergeCells(

            "A1:{$lastColumn}1"

        );



        $sheet->mergeCells(

            "A2:{$lastColumn}2"

        );









        /*
        |--------------------------------------------------------------------------
        | STYLE KOP
        |--------------------------------------------------------------------------
        */


        $sheet

            ->getStyle('A1')

            ->getFont()

            ->setBold(true)

            ->setSize(16);






        $sheet

            ->getStyle('A1:A2')

            ->getAlignment()

            ->setHorizontal(

                Alignment::HORIZONTAL_CENTER

            );






        $sheet

            ->getStyle('A1:A2')

            ->getAlignment()

            ->setVertical(

                Alignment::VERTICAL_CENTER

            );






        $sheet

            ->getRowDimension(1)

            ->setRowHeight(30);




        $sheet

            ->getRowDimension(2)

            ->setRowHeight(22);









        /*
        |--------------------------------------------------------------------------
        | INFO REPORT
        |--------------------------------------------------------------------------
        */


        $sheet

            ->getStyle('A4:C6')

            ->getFont()

            ->setBold(true);







        $sheet

            ->getStyle('A4:A6')

            ->getAlignment()

            ->setHorizontal(

                Alignment::HORIZONTAL_LEFT

            );






        $sheet

            ->getStyle('B4:B6')

            ->getAlignment()

            ->setHorizontal(

                Alignment::HORIZONTAL_CENTER

            );






        $sheet

            ->getStyle('C4:C6')

            ->getAlignment()

            ->setHorizontal(

                Alignment::HORIZONTAL_LEFT

            );









        /*
        |--------------------------------------------------------------------------
        | STYLE KESIMPULAN
        |--------------------------------------------------------------------------
        */


        $sheet

            ->getStyle('A10:C13')

            ->getFont()

            ->setBold(true);





        $sheet

            ->getStyle('A10:C13')

            ->applyFromArray([



                'borders'=>[


                    'allBorders'=>[


                        'borderStyle'

                        =>

                        Border::BORDER_THIN,


                        'color'=>[


                            'rgb'=>'BFBFBF'


                        ],


                    ],


                ],


            ]);








        $sheet

            ->getStyle('A10')

            ->getFont()

            ->setBold(true)

            ->setSize(12);









        /*
        |--------------------------------------------------------------------------
        | HEADER TABLE
        |--------------------------------------------------------------------------
        */


        /*
        
        Struktur baru:

        1  KOP
        2  ALAMAT
        3  kosong
        4  POSYANDU
        5  JENIS REPORT
        6  TANGGAL REPORT
        7  kosong
        8  kosong
        9  kosong
        10 KESIMPULAN
        11 JUMLAH DATA
        12 JUMLAH IBU HAMIL
        13 JUMLAH IBU BALITA
        14 kosong
        15 kosong
        16 kosong
        17 HEADER TABLE


        */


        $headerRow = 17;








        $sheet

            ->getStyle(

                "A{$headerRow}:{$lastColumn}{$headerRow}"

            )

            ->applyFromArray([



                'font'=>[


                    'bold'=>true,


                    'color'=>[


                        'rgb'=>'FFFFFF'


                    ],


                    'size'=>11,


                ],





                'fill'=>[


                    'fillType'

                    =>

                    Fill::FILL_SOLID,



                    'startColor'=>[


                        'rgb'=>'2563EB'


                    ],


                ],






                'alignment'=>[



                    'horizontal'

                    =>

                    Alignment::HORIZONTAL_CENTER,




                    'vertical'

                    =>

                    Alignment::VERTICAL_CENTER,




                    'wrapText'

                    =>

                    true,



                ],





                'borders'=>[



                    'allBorders'=>[



                        'borderStyle'

                        =>

                        Border::BORDER_THIN,



                        'color'=>[


                            'rgb'=>'000000'


                        ],


                    ],


                ],



            ]);






        $sheet

            ->getRowDimension($headerRow)

            ->setRowHeight(45);









        /*
        |--------------------------------------------------------------------------
        | BORDER DATA
        |--------------------------------------------------------------------------
        */


        $sheet

            ->getStyle(

                "A{$headerRow}:{$lastColumn}{$lastRow}"

            )

            ->applyFromArray([



                'borders'=>[



                    'allBorders'=>[



                        'borderStyle'

                        =>

                        Border::BORDER_THIN,



                        'color'=>[


                            'rgb'=>'BFBFBF'


                        ],


                    ],


                ],



                'alignment'=>[



                    'vertical'

                    =>

                    Alignment::VERTICAL_CENTER,



                    'wrapText'

                    =>

                    true,


                ],



            ]);








        /*
        |--------------------------------------------------------------------------
        | FREEZE HEADER
        |--------------------------------------------------------------------------
        */


        $sheet->freezePane(

            "A18"

        );









        /*
        |--------------------------------------------------------------------------
        | JARAK
        |--------------------------------------------------------------------------
        */


        foreach(

            [

                3,

                7,

                8,

                9,

                14,

                15,

                16

            ]

            as $row

        ){


            $sheet

                ->getRowDimension($row)

                ->setRowHeight(18);


        }









        /*
        |--------------------------------------------------------------------------
        | AUTO WIDTH
        |--------------------------------------------------------------------------
        */


        foreach(

            $sheet->getColumnIterator()

            as $column

        ){



            $sheet

                ->getColumnDimension(

                    $column->getColumnIndex()

                )

                ->setAutoSize(true);



        }







        $sheet

            ->getColumnDimension('A')

            ->setWidth(8);



        $sheet

            ->getColumnDimension('B')

            ->setWidth(5);



        $sheet

            ->getColumnDimension('C')

            ->setWidth(30);






        return [


            1=>[

                'font'=>[

                    'bold'=>true

                ]

            ]

        ];



    }









    /*
    |--------------------------------------------------------------------------
    | FORMAT TEXT EXCEL
    |--------------------------------------------------------------------------
    */


    public function columnFormats(): array
    {


        return [


            'A'=>'@',

            'B'=>'@',

            'C'=>'@',

            'D'=>'@',

            'E'=>'@',

            'F'=>'@',

            'G'=>'@',

            'H'=>'@',

            'I'=>'@',

            'J'=>'@',

            'K'=>'@',

            'L'=>'@',

            'M'=>'@',


        ];



    }



}