<?php

namespace App\Http\Controllers\Mahasiswa;

use App\Http\Controllers\Controller;
use App\Models\Mahasiswa;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class MahasiswaController extends Controller
{
    public function register(Request $request)
    {
        $attrs = $request->validate([
            'ktp' => 'required|string|min:16|unique:mahasiswas',
            'nim' => 'required|string|min:8|unique:mahasiswas',
            'nohp' => 'required|string|min:11|unique:mahasiswas',
            'nama' => 'required|string|min:4',
            'email' => 'required|email|unique:mahasiswas',
            'password' => 'required|min:6|confirmed',
        ]);

        $mahasiswa = Mahasiswa::create([
            'ktp' => $attrs['ktp'],
            'nim' => $attrs['nim'],
            'nohp' => $attrs['nohp'],
            'nama' => $attrs['nama'],
            'email' => $attrs['email'],
            'password' => bcrypt($attrs['password']),
        ]);

        return response([
            'mahasiswa' => $mahasiswa,
            'token' => $mahasiswa->createToken('cis')->plainTextToken,
        ], 200);
    }

    public function login(Request $request)
    {
        $attrs = $request->validate([
            'email' => 'required|email',
            'password' => 'required|min:6',
        ]);
        $mahasiswa = Mahasiswa::whereEmail($request->email)->first();
        if (!$mahasiswa || !Hash::check($request->password, $mahasiswa->password)) {
            return response([
                'message' => 'Invalid credentials',
            ], 422);
        }

        $token = $mahasiswa->createToken('cis')->plainTextToken;
        return response([
            'mahasiswas' => $mahasiswa,
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
            'mahasiswa' => auth()->user(),
        ], 200);
    }

}
