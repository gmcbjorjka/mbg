<?php

namespace App\Filament\Pages;


use Filament\Pages\Page;

use Filament\Forms;
use Filament\Forms\Form;


use App\Services\Reports\ReportService;


use Maatwebsite\Excel\Facades\Excel;

use Barryvdh\DomPDF\Facade\Pdf;


use App\Exports\ReportExport;

use App\Models\Sppg;

use Carbon\Carbon;
use Filament\Notifications\Notification;


class Report extends Page
{


    protected static string $view =
        'filament.pages.report';



    protected static ?string $navigationIcon =
        'heroicon-o-document-chart-bar';



    protected static ?string $navigationLabel =
        'Report';



    protected static ?string $navigationGroup =
        'Laporan';



    protected static ?int $navigationSort =
        1;





    public ?array $data=[];



    public string $reportTitle='';



    public array $columns=[];



    public array $reportData=[];

public array $reportMeta = [];

    public array $summary=[

        'total'=>0,

    ];



    public bool $showTable=false;







    public function mount():void
    {

        $this->form->fill([


            'type'=>
                'mobile_user',



            'start_date'=>
                now()->startOfMonth(),



            'end_date'=>
                now(),



            'all_data'=>
                false,


        ]);

    }









    public function form(Form $form):Form
    {

        return $form

        ->schema([



            Forms\Components\Section::make('Filter Report')


            ->description(
                'Pilih jenis laporan dan periode data.'
            )



            ->schema([



                Forms\Components\Grid::make(12)

                ->schema([





                    Forms\Components\Select::make('type')


                    ->label('Jenis Report')


                    ->options([



                        'mobile_user'=>
                            'User Mobile',



                        'schedule'=>
                            'Jadwal',



                        'verification'=>
                            'Verifikasi Penerimaan',



                    ])


                    ->default('mobile_user')


                    ->required()


                    ->columnSpan(4),







                    Forms\Components\DatePicker::make('start_date')


                    ->label('Tanggal Awal')


                    ->native(false)


                    ->disabled(
                        fn($get)=>
                        $get('all_data')
                    )


                    ->columnSpan(2),









                    Forms\Components\DatePicker::make('end_date')


                    ->label('Tanggal Akhir')


                    ->native(false)


                    ->disabled(
                        fn($get)=>
                        $get('all_data')
                    )


                    ->columnSpan(2),







                    Forms\Components\Group::make()


                    ->schema([



                        Forms\Components\Checkbox::make('all_data')


                        ->label('Semua Data')


                        ->live(),



                    ])


                    ->extraAttributes([


                        'class'=>
                            'flex items-center h-full pt-6',


                    ])


                    ->columnSpan(2),







                    Forms\Components\Group::make()


                    ->schema([



                        Forms\Components\Actions::make([



                            Forms\Components\Actions\Action::make('generate')


                            ->label('Tampilkan')


                            ->icon(
                                'heroicon-m-magnifying-glass'
                            )


                            ->button()


                            ->action('generate'),



                        ]),



                    ])


                    ->extraAttributes([


                        'class'=>
                            'flex items-center h-full pt-6',


                    ])


                    ->columnSpan(2),






                ]),




            ]),




        ])


        ->statePath('data');

    }









   public function generate(
    ReportService $service
): void
{

    /*
    |--------------------------------------------------------------------------
    | VALIDASI KHUSUS VERIFIKASI PENERIMAAN
    |--------------------------------------------------------------------------
    */


    if(
        ($this->data['type'] ?? null)
        ===
        'verification'
    ){


        // Tidak boleh semua data

        if(
            ($this->data['all_data'] ?? false)
        ){


            Notification::make()

                ->title('Filter Tidak Valid')

                ->body(
                    'Laporan Verifikasi Penerimaan hanya dapat dicetak berdasarkan periode 1 minggu (Senin-Jumat).'
                )

                ->danger()

                ->send();


            return;


        }





        // Wajib tanggal

        if(
            empty($this->data['start_date'])
            ||
            empty($this->data['end_date'])
        ){


            Notification::make()

                ->title('Tanggal Belum Dipilih')

                ->body(
                    'Silakan pilih periode tanggal untuk laporan verifikasi.'
                )

                ->warning()

                ->send();


            return;


        }





        $start = Carbon::parse(

            $this->data['start_date']

        )
        ->startOfWeek(
            Carbon::MONDAY
        );



        $end = Carbon::parse(

            $this->data['end_date']

        )
        ->endOfWeek(
            Carbon::FRIDAY
        );





        $jumlahHari = $start->diffInDays($end)+1;





        if($jumlahHari > 5){


            Notification::make()

                ->title('Periode Melebihi Batas')

                ->body(
                    'Laporan Verifikasi Penerimaan hanya dapat mengambil data maksimal 1 minggu kerja (Senin-Jumat).'
                )

                ->danger()

                ->send();


            return;


        }


    }







    // RESET DATA

    $this->reportTitle = '';

    $this->columns = [];

    $this->reportData = [];

    $this->summary = [

        'total'=>0,

    ];

    $this->reportMeta = [];







    // GENERATE REPORT

    $result = $service->generate(

        $this->data

    );







    $this->reportTitle =

        $result['title']

        ??

        'Report';







    $this->columns =

        $result['columns']

        ??

        [];







    $this->reportData =

        $result['data']

        ??

        [];







    $this->summary =

        $result['summary']

        ??

        [

            'total'=>

                count(

                    $this->reportData

                )

        ];









    $this->reportMeta = [


        'filter_type' =>

            $this->data['type']

            ??

            null,




        'start_date' =>

            $this->data['start_date']

            ??

            null,




        'end_date' =>

            $this->data['end_date']

            ??

            null,




        'all_data' =>

            $this->data['all_data']

            ??

            false,



    ];







    $this->showTable = true;


}









    public function exportExcel()
{

    $jenis = match($this->data['type'] ?? null){

        'mobile_user'
            => 'user_mobile',

        'schedule'
            => 'jadwal',

        'verification'
            => 'verifikasi_penerimaan',

        default
            => 'laporan'

    };



    $tanggal = now()->format('d-m-Y');



    $namaFile =

    'REPORT_'

        .

        strtoupper($jenis)

        .

        '_'

        .

        $tanggal

        .

        '.xlsx';





    return Excel::download(


        new ReportExport(


            $this->reportData,


            $this->columns,


            $this->summary,


            $this->reportTitle,


            Sppg::current(),


            $this->reportMeta


        ),



        $namaFile


    );

}








public function exportPdf()
{

    $sppg = Sppg::current();



    $html = view(

        'reports.pdf',

        [

            'sppg' => $sppg,

            'title' => $this->reportTitle,

            'columns' => $this->columns,

            'data' => $this->reportData,

            'summary' => $this->summary,

            'meta' => $this->reportMeta,

        ]

    )->render();





    // bersihkan karakter UTF-8 rusak

    $html = preg_replace(

        '/[\x00-\x08\x0B\x0C\x0E-\x1F\x7F]/',

        '',

        $html

    );






    $jenis = match($this->data['type'] ?? null){


        'mobile_user'

            => 'USER_MOBILE',



        'schedule'

            => 'JADWAL',



        'verification'

            => 'VERIFIKASI_PENERIMAAN',



        default

            => 'LAPORAN'


    };





    $tanggal = now()->format('d-m-Y');





    $namaFile =

        'REPORT_'

        .

        $jenis

        .

        '_'

        .

        $tanggal

        .

        '.pdf';







    return response()

        ->streamDownload(


            function () use ($html) {



                echo Pdf::loadHTML($html)


                    ->setPaper(

                        'a4',

                        'landscape'

                    )


                    ->output();



            },


            $namaFile


        );


}





}