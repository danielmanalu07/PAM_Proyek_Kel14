<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\admins;
use App\Models\IzinKeluar;
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

    public function update(Request $request, IzinKeluar $izinKeluar)
    {
        $validatedData = $request->validate([
            'status' => 'required|in:0,1,2',
        ]);
        $izinKeluar->update($validatedData);
        return response()->json($izinKeluar, 200);
    }
}
