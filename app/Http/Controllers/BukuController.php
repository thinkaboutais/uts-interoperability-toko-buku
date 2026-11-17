<?php

namespace App\Http\Controllers;

use App\Models\Buku;
use Illuminate\Http\Request;

class BukuController extends Controller
{
    // Menampilkan semua buku dan filter berdasarkan penerbit
    public function index(Request $request)
    {
        $query = Buku::with('penerbit');

        if ($request->has('penerbit_id')) {
            $query->where('penerbit_id', $request->penerbit_id);
        }

        $data = $query->get();

        return response()->json([
            'message' => 'Data buku berhasil ditampilkan',
            'data' => $data
        ]);
    }

    // Menampilkan detail buku
    public function show(int $id)
    {
        $data = Buku::with('penerbit')->find($id);

        if (!$data) {
            return response()->json([
                'message' => 'Buku tidak ditemukan'
            ], 404);
        }

        return response()->json([
            'message' => 'Detail buku berhasil ditampilkan',
            'data' => $data
        ]);
    }

    // Menambahkan buku
    public function store(Request $request)
    {
        $data = Buku::create($request->all());

        return response()->json([
            'message' => 'Buku berhasil ditambahkan',
            'data' => $data
        ], 201);
    }

    // Mengubah buku
    public function update(Request $request, int $id)
    {
        $data = Buku::find($id);

        if (!$data) {
            return response()->json([
                'message' => 'Buku tidak ditemukan'
            ], 404);
        }

        $data->update($request->all());

        return response()->json([
            'message' => 'Buku berhasil diperbarui',
            'data' => $data
        ]);
    }

    // Menghapus buku
    public function destroy(int $id)
    {
        $data = Buku::find($id);

        if (!$data) {
            return response()->json([
                'message' => 'Buku tidak ditemukan'
            ], 404);
        }

        $data->delete();

        return response()->json([
            'message' => 'Buku berhasil dihapus'
        ]);
    }
}