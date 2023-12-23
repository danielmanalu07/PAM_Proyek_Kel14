<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;

class Kaos extends Model
{
    use HasFactory, Notifiable;

    protected $fillable = [
        'NamaBarang',
        'Gambar',
        'size',
        'Harga',
        'Deskripsi',
    ];
}
