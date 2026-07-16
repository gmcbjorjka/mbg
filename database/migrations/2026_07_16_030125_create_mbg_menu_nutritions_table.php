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
        Schema::create('mbg_menu_nutritions', function (Blueprint $table) {

            $table->id();


            $table->foreignId('menu_id')
                ->constrained('mbg_menus')
                ->cascadeOnDelete();



            $table->string('name');



            $table->string('value');


            $table->integer('sort')
                ->default(0);


            $table->timestamps();

        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('mbg_menu_nutritions');
    }
};
