<?php

namespace App\Services\Reports;


use App\Services\Reports\MobileUserReport;
use App\Services\Reports\ScheduleReport;
use App\Services\Reports\VerificationReport;


class ReportService
{


    public function generate(array $filter): array
    {

        return match($filter['type'] ?? null) {


            'mobile_user' =>

                app(MobileUserReport::class)
                    ->handle($filter),



            'schedule' =>

                app(ScheduleReport::class)
                    ->handle($filter),



            'verification' =>

                app(VerificationReport::class)
                    ->handle($filter),



            default => $this->emptyResult(),


        };


    }





    private function emptyResult(): array
    {

        return [

            'title'=>'Report',


            'columns'=>[],


            'data'=>[],


            'summary'=>[

                'total'=>0

            ],


        ];

    }


}