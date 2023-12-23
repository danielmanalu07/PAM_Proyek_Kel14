<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Kaos;
use Illuminate\Http\Request;

class KaosController extends Controller
{
    public function index()
    {
        try {
            $kaos = Kaos::all();

            $baseUrl = url('/uploads/');

            $kaos = $kaos->map(function ($kaosItem) use ($baseUrl) {
                $kaosItem->Gambar = $baseUrl . $kaosItem->Gambar;
                return $kaosItem;
            });

            return response()->json($kaos, 200);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }

    public function store(Request $request)
    {
        try {
            $request->validate([
                'NamaBarang' => 'required|string',
                'Gambar' => 'required|string',
                'size' => 'required|in:S,M,L,XL,XXL',
                'Harga' => 'required|numeric',
                'Deskripsi' => 'required',
            ]);

            $imageData = base64_decode($request->input('Gambar'));
            $fileName = time() . '_image.png';
            file_put_contents(public_path('uploads') . $fileName, $imageData);

            $request['Gambar'] = $fileName;
            $kaos = Kaos::create($request->all());

            return response()->json($kaos, 201);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }

    public function update(Request $request, $id)
    {
        $update = Kaos::find($id);

        $validatedData = $request->validate([
            'NamaBarang' => 'required|string',
            'Gambar' => 'image|mimes:png,jpg,jpeg',
            'size' => 'required|in:S,M,L,XL,XXL',
            'Harga' => 'required|numeric',
            'Deskripsi' => 'required',
        ]);

        if ($request->has('Gambar')) {
            $imageData = base64_decode($request->input('Gambar'));
            $fileName = time() . '_image.png';
            file_put_contents(public_path('uploads') . $fileName, $imageData);

            $request['Gambar'] = $fileName;
        }

        $update->update($validatedData);
        return response()->json($update, 200);
    }

    public function destroy($id)
    {
        $hapus = Kaos::find($id);
        $hapus->delete();
        return response()->json(['message' => 'Berhasil Dihapus'], 200);
    }
}
