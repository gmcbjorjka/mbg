<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class () extends Migration {
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('mbg_menus', function (Blueprint $table) {

            $table->id();

            // tanggal menu
            $table->date('date');


            // judul
            $table->string('title')
                ->default('Menu Hari Ini');


            // gambar menu
            $table->string('image')
                ->nullable();


            // informasi tambahan
            $table->text('description')
                ->nullable();


            // status tampil
            $table->boolean('is_active')
                ->default(true);


            $table->timestamps();

        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('mbg_menus');
    }
};
