<?php

namespace App\Models;

use App\Models\Traits\FileUploadTrait;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;

class PaymentCard extends Model
{
    public $table = "payment_cards";

    protected $guarded = ['id'];


}
