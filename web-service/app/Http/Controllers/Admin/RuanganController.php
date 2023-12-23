<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Resources\RuanganResource;
use App\Models\Ruangan;
use Illuminate\Http\Request;

class RuanganController extends Controller
{
    public function index()
    {
        $ruangan = Ruangan::all();
        return response()->json($ruangan, 200);
    }

    public function store(Request $request)
    {
        try {
            $request->validate([
                'Ruangan' => 'required|min:5|string',
            ]);

            $ruangan = Ruangan::create($request->all());

            return new RuanganResource($ruangan);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
    public function update(Request $request, Ruangan $ruangan, $id)
    {
        $update = Ruangan::find($id);

        $validatedData = $request->validate([
            'Ruangan' => 'required|string',
        ]);
        $update->update($validatedData);
        return response()->json($ruangan, 200) . $ruangan->$id;
    }

    public function destroy(Ruangan $ruangan, $id)
    {
        $hapus = Ruangan::find($id);
        $hapus->delete();

        return response()->json(['message' => 'Berhasil Dihapus'], 200);
    }

}
