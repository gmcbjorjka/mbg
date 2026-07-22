<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;

class Profile extends Model
{
    protected $fillable = [

        'user_id',

        'address',

        'nik',

        'birth_date',

        'gender',

        'beneficiary_type',

        'photo',

        'child_name',

        'child_birth_date',

    ];



    protected $appends = [

        'age_information',

    ];



    public function getAgeInformationAttribute()
    {
        if (!$this->child_birth_date) {
            return '-';
        }


        $date = Carbon::parse($this->child_birth_date);



        // Ibu hamil: hitung usia kandungan dari HPHT
        if ($this->beneficiary_type === 'pregnant') {

            $weeks = $date->diffInWeeks(now());

            return $weeks . ' minggu';

        }



        // Orang tua balita: hitung usia anak
        if ($this->beneficiary_type === 'toddler_parent') {

            $years = $date->diffInYears(now());


            $months = $date
                ->copy()
                ->addYears($years)
                ->diffInMonths(now());


            return $years . ' tahun ' . $months . ' bulan';

        }



        return '-';
    }




    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
