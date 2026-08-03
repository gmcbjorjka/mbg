<x-filament-panels::page>


    {{ $this->form }}



    @if($showTable)


        <div
            class="
                mt-6
                flex
                justify-end
                gap-3
            "
        >


            <x-filament::button

                wire:click="exportExcel"

                color="success"

                icon="heroicon-o-arrow-down-tray"

            >

                Export Excel

            </x-filament::button>




            <x-filament::button

                wire:click="exportPdf"

                color="danger"

                icon="heroicon-o-document-arrow-down"

            >

                Export PDF

            </x-filament::button>



        </div>





        @include(

            'reports.table',

            [

                'title'=>$reportTitle,

                'columns'=>$columns,

                'data'=>$reportData,

                'summary'=>$summary

            ]

        )


    @endif



</x-filament-panels::page>