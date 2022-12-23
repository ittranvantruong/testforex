<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Casts\AsArrayObject;

class RegisterMaster extends Model
{
    use HasFactory;
    
    protected $table = 'register_master';
    
    protected $guarded = [];
    
    protected $casts = [
        'info' => AsArrayObject::class,
    ];
}
