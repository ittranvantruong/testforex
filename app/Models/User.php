<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $guarded = [];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function info(){
        return $this->hasOne(UserInfo::class, 'user_id', 'id');
    }
    public function wallet(){
        return $this->hasOne(Wallet::class, 'user_id', 'id');
    }
    public function bank(){
        return $this->hasOne(UserBank::class, 'user_id', 'id');
    }

    public function signals(){
        return $this->hasMany(Signal::class, 'user_id', 'id');
    }
    // ds master ma user dang theo doi master
    public function followings(){
        return $this->belongsToMany(User::class, 'follows', 'from_user_id', 'to_user_id')->withPivot('expired_at');
    }
    // danh sach user dang theo doi master
    public function followers(){
        return $this->belongsToMany(User::class, 'follows', 'to_user_id', 'from_user_id')->withPivot('expired_at');
    }
    public function transactions(){
        return $this->hasMany(Transaction::class, 'user_id');
    }
}
