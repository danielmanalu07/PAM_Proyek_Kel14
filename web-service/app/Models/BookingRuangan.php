<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;

class BookingRuangan extends Model
{
    use HasFactory, Notifiable;
    protected $fillable = [
        'mahasiswa_id',
        'ruangan_id',
        'RencanaMulai',
        'RencanaBerakhir',
        'Keperluan',
        'status',
    ];

    public function Mahasiswa()
    {
        return $this->belongsTo(Mahasiswa::class, 'mahasiswa_id');
    }

    public function Ruangan()
    {
        return $this->belongsTo(Ruangan::class, 'ruangan_id');
    }
}
