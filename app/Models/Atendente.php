<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use App\Models\Pessoa;

class Atendente extends Pessoa
{
    use HasFactory;

    protected $table = "pessoa";

}
