<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;

class Ruangan extends Model
{
    use HasFactory, Notifiable;
    protected $fillable = [
        'Ruangan',
    ];

    public function BookingRuangan()
    {
        return $this->hasMany(BookingRuangan::class);
    }
}
