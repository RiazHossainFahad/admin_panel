<?php

namespace App\Http\Controllers;

use App\Exports\UsersExport;
use Illuminate\Http\Request;
use Maatwebsite\Excel\Facades\Excel;

class DataController extends Controller
{
    public function import(Request $req){}
    public function export(){
        return Excel::download(new UsersExport, 'users.xlsx');
    }
}
