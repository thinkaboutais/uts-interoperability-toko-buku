<?php

namespace App\Http\Controllers;

use App\Models\Penerbit;
use Illuminate\Http\Request;

class PenerbitController extends Controller
{
    // Menampilkan semua penerbit
    public function index()
    {
        $data = Penerbit::all();

        return response()->json([
            'message' => 'Data penerbit berhasil ditampilkan',
            'data' => $data
        ]);
    }

    // Menampilkan detail penerbit
    public function show($id)
    {
        $data = Penerbit::find($id);

        if (!$data) {
            return response()->json([
                'message' => 'Penerbit tidak ditemukan'
            ], 404);
        }

        return response()->json([
            'message' => 'Detail penerbit berhasil ditampilkan',
            'data' => $data
        ]);
    }

    // Menambahkan penerbit
    public function store(Request $request)
    {
        $data = Penerbit::create($request->all());

        return response()->json([
            'message' => 'Penerbit berhasil ditambahkan',
            'data' => $data
        ], 201);
    }

    // Mengubah penerbit
    public function update(Request $request, int $id)
    {
        $data = Penerbit::find($id);

        if (!$data) {
            return response()->json([
                'message' => 'Penerbit tidak ditemukan'
            ], 404);
        }

        $data->update($request->all());

        return response()->json([
            'message' => 'Penerbit berhasil diperbarui',
            'data' => $data
        ]);
    }

    // Menghapus penerbit
    public function destroy($id)
    {
        $data = Penerbit::find($id);

        if (!$data) {
            return response()->json([
                'message' => 'Penerbit tidak ditemukan'
            ], 404);
        }

        $data->delete();

        return response()->json([
            'message' => 'Penerbit berhasil dihapus'
        ]);
    }
}
