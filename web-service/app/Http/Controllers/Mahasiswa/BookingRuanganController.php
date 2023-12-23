<?php

namespace App\Http\Controllers\Mahasiswa;

use App\Http\Controllers\Controller;
use App\Models\BookingRuangan;
use App\Models\Ruangan;
use Illuminate\Http\Request;

class BookingRuanganController extends Controller
{
    public function index()
    {
        $mahasiswaId = auth()->user()->id;
        $br = BookingRuangan::where(['mahasiswa_id' => $mahasiswaId])->get();

        return response()->json($br, 200);
    }

    public function store(Request $request)
    {
        $mahasiswaId = auth()->user()->id;

        $validatedData = $request->validate([
            'RencanaMulai' => 'required|date',
            'RencanaBerakhir' => 'required|date',
            'Keperluan' => 'required|string',
            'ruangan_id' => 'required|exists:ruangans,id',
        ]);

        $ruangan = Ruangan::findOrFail($validatedData['ruangan_id']);

        $br = BookingRuangan::create(array_merge($validatedData, [
            'mahasiswa_id' => $mahasiswaId,
            'status' => 0,
        ]));

        return response()->json($br, 201);
    }

    public function update(Request $request, BookingRuangan $br)
    {
        $validatedData = $request->validate([
            'RencanaMulai' => 'required|date',
            'RencanaBerakhir' => 'required|date',
            'Keperluan' => 'required|string',
            'status' => 'required|in:0,1,2',
        ]);
        $br->update($validatedData);
        return response()->json($br, 200);
    }
}
