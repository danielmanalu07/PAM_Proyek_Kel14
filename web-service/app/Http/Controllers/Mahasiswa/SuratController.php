<?php

namespace App\Http\Controllers\Mahasiswa;

use App\Http\Controllers\Controller;
use App\Models\Surat;
use Illuminate\Http\Request;

class SuratController extends Controller
{
    public function index()
    {
        $mahasiswaId = auth()->user()->id;
        $surat = Surat::where('mahasiswa_id', $mahasiswaId)->get();
        return response()->json($surat, 200);
    }
    public function store(Request $request)
    {
        $mahasiswa_id = auth()->user()->id;

        $validatedData = $request->validate([
            'Tujuan' => 'required|string',
            'TanggalPengambilan' => 'required|date',
        ]);

        $surat = Surat::create(array_merge($validatedData, ['mahasiswa_id' => $mahasiswa_id, 'status' => 0]));

        return response()->json($surat, 201);
    }

    public function update(Request $request, Surat $surat)
    {
        $validatedData = $request->validate([
            'Tujuan' => 'required|string',
            'TanggalPengambilan' => 'required|date',
            'status' => 'required|in:0,1,2',
        ]);
        $surat->update($validatedData);
        return response()->json($surat, 200);
    }
}
