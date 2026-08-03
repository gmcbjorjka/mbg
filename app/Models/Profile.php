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


        // Data Anak / HPHT

        'child_name',

        'child_nik',

        'child_gender',

        'child_birth_date',

    ];



    protected $casts = [

        'birth_date' => 'date',

        'child_birth_date' => 'date',

    ];



    protected $appends = [

        'age_information',

        'child_gender_label',

        'gender_label',

    ];



    /*
    |--------------------------------------------------------------------------
    | Accessor Usia / Kehamilan / Usia Anak
    |--------------------------------------------------------------------------
    */

    public function getAgeInformationAttribute()
    {

        if (!$this->child_birth_date) {

            return '-';

        }



        $date = Carbon::parse(
            $this->child_birth_date
        );



        // Ibu hamil
        // child_birth_date = HPHT

        if ($this->beneficiary_type === 'pregnant') {


            $weeks = $date->diffInWeeks(
                now()
            );


            return $weeks . ' minggu';


        }





        // Orang tua balita
        // child_birth_date = tanggal lahir anak

        if ($this->beneficiary_type === 'toddler_parent') {


            $years = $date->diffInYears(
                now()
            );


            $months = $date

                ->copy()

                ->addYears($years)

                ->diffInMonths(
                    now()
                );


            return $years . ' tahun ' . $months . ' bulan';


        }



        return '-';

    }





    /*
    |--------------------------------------------------------------------------
    | Gender Orang Tua
    |--------------------------------------------------------------------------
    */

    public function getGenderLabelAttribute()
    {

        return match($this->gender){

            'male' =>
                'Laki-laki',

            'female' =>
                'Perempuan',

            default =>
                '-',

        };

    }





    /*
    |--------------------------------------------------------------------------
    | Gender Anak
    |--------------------------------------------------------------------------
    */

    public function getChildGenderLabelAttribute()
    {

        return match($this->child_gender){

            'male' =>
                'Laki-laki',

            'female' =>
                'Perempuan',

            default =>
                '-',

        };

    }





    /*
    |--------------------------------------------------------------------------
    | Relationship
    |--------------------------------------------------------------------------
    */

    public function user()
    {

        return $this->belongsTo(
            User::class
        );

    }





    /*
    |--------------------------------------------------------------------------
    | Auto Clear Data Anak
    |--------------------------------------------------------------------------
    */

    protected static function booted()
    {

        static::saving(function ($profile) {


            if ($profile->beneficiary_type === 'pregnant') {


                // Ibu hamil tidak memiliki data anak

                $profile->child_name = null;

                $profile->child_nik = null;

                $profile->child_gender = null;


                /*
                 * Jangan hapus child_birth_date
                 *
                 * karena digunakan sebagai HPHT
                 *
                 */


            }



            if ($profile->beneficiary_type === 'toddler_parent') {


                /*
                 * child_birth_date digunakan
                 * sebagai tanggal lahir anak
                 *
                 */


            }


        });

    }

}