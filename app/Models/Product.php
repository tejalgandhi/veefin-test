<?php

namespace App\Models;

use App\Models\Traits\FileUploadTrait;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;

class Product extends Model
{
    use HasFactory,FileUploadTrait;
    public $table = "products";

    protected $guarded = ['id'];

    public static function boot() {
        parent::boot();

        // create a event to happen on saving
        static::saving(function($model)  {
            $model->created_by = Auth::user()->id ?? NULL;
        });
    }


}
