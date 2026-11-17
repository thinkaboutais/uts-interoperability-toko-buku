<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Penerbit extends Model
{
    protected $table = 'penerbit';

    protected $fillable = [
        'kode_penerbit',
        'nama_penerbit',
        'alamat',
        'kota',
        'provinsi',
        'kode_pos',
        'telepon',
        'email',
        'website',
        'status'
    ];

    public function buku()
    {
        return $this->hasMany(Buku::class, 'penerbit_id');
    }
}
