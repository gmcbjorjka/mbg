<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class () extends Migration {
    public function up(): void
    {
        Schema::create('profiles', function (Blueprint $table) {

            $table->id();


            // relasi ke users
            $table->foreignId('user_id')
                ->constrained()
                ->cascadeOnDelete();


            // biodata
            $table->string('address')->nullable();

            $table->date('birth_date')->nullable();

            $table->enum('gender', [
                'male',
                'female'
            ])->nullable();



            // khusus program MBG
            $table->enum('beneficiary_type', [
                'pregnant',
                'toddler_parent'
            ])->nullable();



            // tambahan data
            $table->string('nik')
                ->nullable()
                ->unique();


            $table->string('photo')
                ->nullable();

            // Child information
            $table->string('child_name')->nullable();

            $table->date('child_birth_date')->nullable();


            $table->timestamps();

        });
    }


    public function down(): void
    {
        Schema::dropIfExists('profiles');
    }
};
