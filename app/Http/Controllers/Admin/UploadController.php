<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Services\UploadService;
use Illuminate\Routing\Controller;

class UploadController extends Controller
{
    protected $upload;

    public function __construct(UploadService $upload)
    {
        $this->upload = $upload;
    }

    public function store(Request $request)
    {
        $url = $this->upload->store($request);

        if ($url !== false) {
            return response()->json([
                'error' => false,
                'url'   => $url
            ]);
        }

        return response()->json(['error' => true]);
    }
}
