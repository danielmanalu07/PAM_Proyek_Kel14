<?php

namespace App\Http\Controllers\Mahasiswa;

use App\Http\Controllers\Controller;
use App\Models\IzinBermalam;
use Illuminate\Http\Request;

class IzinBermalamController extends Controller
{
    public function index()
    {
        $mahasiswaId = auth()->user()->id;
        $ib = IzinBermalam::where('mahasiswa_id', $mahasiswaId)->get();
        return response()->json($ib, 200);
    }
    public function store(Request $request)
    {
        $mahasiswa_id = auth()->user()->id;

        $validatedData = $request->validate([
            'RencanaBerangkat' => 'required|date',
            'RencanaKembali' => 'required|date',
            'Keperluan' => 'required|string',
            'Tujuan' => 'required|string',
        ]);

        $ib = IzinBermalam::create(array_merge($validatedData, ['mahasiswa_id' => $mahasiswa_id, 'status' => 0]));

        return response()->json($ib, 201);
    }

    public function update(Request $request, IzinBermalam $ib)
    {
        $validatedData = $request->validate([
            'RencanaBerangkat' => 'required|date',
            'RencanaKembali' => 'required|date',
            'Keperluan' => 'required|string',
            'Tujuan' => 'required|string',
            'status' => 'required|in:0,1,2',
        ]);
        $ib->update($validatedData);
        return response()->json($ib, 200);
    }
}
