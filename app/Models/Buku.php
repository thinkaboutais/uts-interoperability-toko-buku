<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Buku extends Model
{
    protected $table = 'buku';

    protected $fillable = [
        'penerbit_id',
        'isbn',
        'judul',
        'penulis',
        'kategori',
        'tahun_terbit',
        'harga',
        'stok',
        'deskripsi'
    ];

    public function penerbit()
    {
        return $this->belongsTo(Penerbit::class, 'penerbit_id');
    }
}