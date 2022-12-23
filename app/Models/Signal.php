<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Signal extends Model
{
    use HasFactory;
    protected $table = 'signals';
    protected $guarded = [];
    
    public function user(){
        return $this->belongsTo(User::class, 'user_id');
    }
}
