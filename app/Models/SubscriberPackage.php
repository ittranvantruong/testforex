<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SubscriberPackage extends Model
{
    use HasFactory;
    protected $table = 'subscriber_package';
    protected $guarded = [];
}
