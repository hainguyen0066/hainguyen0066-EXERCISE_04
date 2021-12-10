<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Routing\Controller;

class MainController extends Controller
{
    public function index()
    {
        return view('admin.home', [
           'title' => 'Trang Quản Trị Admin'
        ]);
    }
}
