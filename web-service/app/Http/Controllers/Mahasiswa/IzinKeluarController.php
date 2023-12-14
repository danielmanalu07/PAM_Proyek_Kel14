<?php

namespace App\Http\Controllers\Mahasiswa;

use App\Http\Controllers\Controller;
use App\Models\IzinKeluar;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class IzinKeluarController extends Controller
{
    public function index()
    {
        $mahasiswaId = auth()->user()->id;
        $izinKeluars = IzinKeluar::where('mahasiswa_id', $mahasiswaId)->get();
        return response()->json($izinKeluars, 200);
    }
    public function store(Request $request)
    {
        $mahasiswa_id = auth()->user()->id;

        $validatedData = $request->validate([
            'RencanaBerangkat' => 'required|date',
            'RencanaKembali' => 'required|date',
            'Keperluan' => 'required|string',
        ]);

        $izinKeluar = IzinKeluar::create(array_merge($validatedData, ['mahasiswa_id' => $mahasiswa_id, 'status' => 0]));

        return response()->json($izinKeluar, 201);
    }

    public function update(Request $request, IzinKeluar $izinKeluar)
    {
        $validatedData = $request->validate([
            'RencanaBerangkat' => 'required|date',
            'RencanaKembali' => 'required|date',
            'Keperluan' => 'required|string',
            'status' => 'required|in:0,1,2',
        ]);
        $izinKeluar->update($validatedData);
        return response()->json($izinKeluar, 200);
    }
}
