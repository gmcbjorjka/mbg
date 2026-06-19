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
        Schema::create('users', function (Blueprint $table) {
            $table->id();

            $table->string('name');

            // ADMIN LOGIN (Filament)
            $table->string('email')->unique()->nullable();

            // MOBILE LOGIN (future OTP)
            $table->string('phone')->unique()->nullable();

            $table->string('password');

            $table->enum('role', [
                'super_admin',
                'admin',
                'user'
            ]);

            $table->enum('status', [
                'active',
                'inactive'
            ])->default('active');

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('users');
    }
};
