<?php

namespace App\Exports;


use Maatwebsite\Excel\Concerns\FromArray;
use Maatwebsite\Excel\Concerns\WithEvents;
use Maatwebsite\Excel\Concerns\WithStyles;

use Maatwebsite\Excel\Events\AfterSheet;

use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;

use PhpOffice\PhpSpreadsheet\Style\Alignment;
use PhpOffice\PhpSpreadsheet\Style\Border;
use PhpOffice\PhpSpreadsheet\Style\Fill;



class ReportExport implements FromArray, WithEvents, WithStyles
{


    protected array $data;

    protected array $columns;

    protected array $summary;

    protected string $title;

    protected $sppg;

    protected array $meta;



    public function __construct(

        array $data,

        array $columns,

        array $summary,

        string $title,

        $sppg,

        array $meta = []

    ){

        $this->data = $data;

        $this->columns = $columns;

        $this->summary = $summary;

        $this->title = $title;

        $this->sppg = $sppg;

        $this->meta = $meta;

    }





    public function array(): array
    {


        $rows = [];



        /*
        Jumlah kolom kosong mengikuti tabel
        */

        $empty = array_fill(

            0,

            count($this->columns)+2,

            ''

        );






        /*
        =========================
        KOP SPPG
        =========================
        */


        $rows[]=[

            strtoupper(

                $this->sppg->name ?? 'SPPG'

            )

        ];



        $rows[]=[

            $this->sppg->address ?? '-'

        ];



        $rows[]=[

            'Posyandu : '.

            ($this->sppg->posyandu_name ?? '-')

        ];





        // BARIS KOSONG

        $rows[]=$empty;

        $rows[]=$empty;







        /*
        =========================
        FILTER
        =========================
        */


        $rows[]=[

            'Jenis Laporan',

            match($this->meta['type'] ?? null){


                'mobile_user'
                    =>
                    'User Mobile',


                'schedule'
                    =>
                    'Jadwal MBG',


                'verification'
                    =>
                    'Verifikasi Penerimaan',


                default
                    =>
                    $this->title

            }


        ];




        $rows[]=[

            'Periode Data',

            ($this->meta['all_data'] ?? false)


            ?

            'Semua Data'


            :


            (

                ($this->meta['start_date'] ?? '-')

                .

                ' s/d '

                .

                ($this->meta['end_date'] ?? '-')

            )


        ];




        $rows[]=[

            'Tanggal Cetak',

            now()->format('d-m-Y')

        ];







        // BARIS KOSONG


        $rows[]=$empty;

        $rows[]=$empty;









        /*
        =========================
        RANGKUMAN
        =========================
        */


        $rows[]=[

            'Rangkuman'

        ];




        foreach(

            $this->summary

            as $key=>$value

        ){


            $label = match($key){


                'total'
                =>
                'Total Data',



                'pregnant'
                =>
                'Ibu Hamil',



                'toddler'
                =>
                'Orang Tua Balita',



                default
                =>
                ucwords(

                    str_replace(

                        '_',

                        ' ',

                        $key

                    )

                )

            };




            $rows[]=[

                $label,

                $value

            ];



        }






        // BARIS KOSONG SEBELUM TABEL


        $rows[]=$empty;

        $rows[]=$empty;







        /*
        =========================
        HEADER TABEL
        =========================
        */


        $rows[]=array_merge(

            [

                'No'

            ],


            array_values(

                $this->columns

            )

        );









        /*
        =========================
        DATA
        =========================
        */


        foreach(

            $this->data

            as $index=>$row

        ){



            $line=[];



            $line[]=$index+1;





            foreach(

                $this->columns

                as $key=>$label

            ){



                $value =

                    $row[$key] ?? '-';





                if(

                    in_array(

                        $key,

                        [

                            'no_hp',

                            'nik',

                            'nik_anak'

                        ]

                    )

                ){

                    $value="'".$value;

                }





                $line[]=$value;


            }




            $rows[]=$line;



        }






        return $rows;


    }









    public function styles(

        Worksheet $sheet

    ){


        return [


            1=>[

                'font'=>[

                    'bold'=>true,

                    'size'=>14

                ]

            ],


        ];

    }









    public function registerEvents(): array
    {


        return [



            AfterSheet::class => function(

                AfterSheet $event

            ){



                $sheet=$event->sheet;



                $lastColumn =

                    $sheet->getHighestColumn();



                $lastRow =

                    $sheet->getHighestRow();





                /*
                MERGE KOP

                */


                foreach(

                    [1,2,3]

                    as $row

                ){

                    $sheet->mergeCells(

                        "A{$row}:{$lastColumn}{$row}"

                    );

                }







                /*
                CENTER KOP

                */


                $sheet->getStyle(

                    "A1:{$lastColumn}3"

                )->applyFromArray([


                    'alignment'=>[


                        'horizontal'=>

                        Alignment::HORIZONTAL_CENTER


                    ]


                ]);








                /*
                CARI HEADER TABEL

                */


                $headerRow =

                    $lastRow - count($this->data);







                /*
                STYLE HEADER

                */


                $sheet->getStyle(

                    "A{$headerRow}:{$lastColumn}{$headerRow}"

                )->applyFromArray([



                    'font'=>[

                        'bold'=>true,

                        'color'=>[

                            'rgb'=>'FFFFFF'

                        ]

                    ],



                    'fill'=>[

                        'fillType'=>

                        Fill::FILL_SOLID,


                        'color'=>[

                            'rgb'=>'374151'

                        ]

                    ],



                    'alignment'=>[


                        'horizontal'=>

                        Alignment::HORIZONTAL_CENTER


                    ]



                ]);








                /*
                BORDER TABEL

                */


                $sheet->getStyle(

                    "A{$headerRow}:{$lastColumn}{$lastRow}"

                )->applyFromArray([


                    'borders'=>[


                        'allBorders'=>[


                            'borderStyle'=>

                            Border::BORDER_THIN


                        ]


                    ]


                ]);







                /*
                AUTO WIDTH

                */


                foreach(

                    range(

                        'A',

                        $lastColumn

                    )

                    as $column

                ){


                    $sheet

                    ->getColumnDimension($column)

                    ->setAutoSize(true);


                }






                /*
                WRAP TEXT

                */


                $sheet->getStyle(

                    "A1:{$lastColumn}{$lastRow}"

                )->getAlignment()

                ->setWrapText(true);






                /*
                FREEZE HEADER

                */


                $sheet->freezePane(

                    "A".($headerRow+1)

                );



            }


        ];

    }


}