<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;

class IzinKeluar extends Model
{
    use HasFactory, Notifiable;
    protected $fillable = [
        'mahasiswa_id',
        'RencanaBerangkat',
        'RencanaKembali',
        'Keperluan',
        'status',
    ];

    public function mahasiswa()
    {
        return $this->belongsTo(Mahasiswa::class, 'mahasiswa_id');
    }
}
