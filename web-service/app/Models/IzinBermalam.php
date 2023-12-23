<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;

class IzinBermalam extends Model
{
    use HasFactory, Notifiable;
    protected $fillable = [
        'mahasiswa_id',
        'RencanaBerangkat',
        'RencanaKembali',
        'Keperluan',
        'Tujuan',
        'status',
    ];
}
