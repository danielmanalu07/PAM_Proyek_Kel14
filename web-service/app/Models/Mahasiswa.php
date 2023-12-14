<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class Mahasiswa extends Model
{
    use HasApiTokens, HasFactory, Notifiable;
    protected $fillable = [
        'ktp',
        'nim',
        'nohp',
        'nama',
        'email',
        'password',
    ];

    public function IzinKeluar()
    {
        return $this->hasMany(IzinKeluar::class, 'id');
    }
}
