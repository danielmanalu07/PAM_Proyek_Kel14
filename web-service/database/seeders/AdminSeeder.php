<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class AdminSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('admins')->insert([
            'id' => 1,
            'username' => 'baakitdel',
            'email' => 'baak@gmail.com',
            'password' => bcrypt('baak12345'),
        ]);
    }
}
