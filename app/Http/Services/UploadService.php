<?php


namespace App\Http\Services;


use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

class UploadService
{

    public static function uploadThumb($thumbObj, $folderUpload = 'product') {
        $thumbName        = Str::random(10) . '.' . $thumbObj->clientExtension();
        $thumbObj->storeAs($folderUpload, $thumbName, 'zvn_storage_image' );

        return $thumbName;
    }

    public static function deleteThumb($thumbName, $folderUpload = 'product'){
        Storage::disk('zvn_storage_image')->delete($folderUpload. '/' . $thumbName);
    }
}
