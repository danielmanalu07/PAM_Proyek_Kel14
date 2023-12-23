<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\admins;
use App\Models\BookingRuangan;
use App\Models\IzinBermalam;
use App\Models\IzinKeluar;
use App\Models\Mahasiswa;
use App\Models\Ruangan;
use App\Models\Surat;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class AdminController extends Controller
{
    public function login(Request $request)
    {
        $attrs = $request->validate([
            'email' => 'required|email',
            'password' => 'required|min:6',
        ]);
        $admin = admins::whereEmail($request->email)->first();
        if (!$admin || !Hash::check($request->password, $admin->password)) {
            return response([
                'message' => 'Invalid credentials',
            ], 422);
        }

        $token = $admin->createToken('cis')->plainTextToken;
        return response([
            'admin' => $admin,
            'token' => $token,
        ], 200);
    }

    public function logout()
    {
        auth()->user()->tokens()->delete();
        return response([
            'message' => 'Logout Success',
        ], 200);
    }

    public function user()
    {
        return response([
            'admin' => auth()->user(),
        ], 200);
    }

    public function getIK()
    {
        $ik = IzinKeluar::all();

        return response()->json($ik, 200);
    }

    public function getmhs()
    {
        $mhs = Mahasiswa::all();

        return response()->json($mhs, 200);
    }
    public function getIB()
    {
        $ik = IzinBermalam::all();

        return response()->json($ik, 200);
    }
    public function getSurat()
    {
        $surat = Surat::all();

        return response()->json($surat, 200);
    }

    public function getBookingRuangan()
    {
        $br = BookingRuangan::all();
        return response()->json($br, 200);
    }

    public function getRuangan()
    {
        $ruangan = Ruangan::all();

        return response()->json($ruangan, 200);
    }

    public function update(Request $request, IzinKeluar $izinKeluar)
    {
        $validatedData = $request->validate([
            'status' => 'required|in:0,1,2',
        ]);
        $izinKeluar->update($validatedData);
        return response()->json($izinKeluar, 200);
    }

    public function updateib(Request $request, IzinBermalam $ib)
    {
        $validatedData = $request->validate([
            'status' => 'required|in:0,1,2',
        ]);
        $ib->update($validatedData);
        return response()->json($ib, 200);
    }
    public function updatesurat(Request $request, Surat $surat)
    {
        $validatedData = $request->validate([
            'status' => 'required|in:0,1,2',
        ]);
        $surat->update($validatedData);
        return response()->json($surat, 200);
    }

    public function updateBr(Request $request, BookingRuangan $br)
    {
        $validateData = $request->validate([
            'status' => 'required|in:0,1,2',
        ]);
        $br->update($validateData);
        return response()->json($br, 200);
    }
}
