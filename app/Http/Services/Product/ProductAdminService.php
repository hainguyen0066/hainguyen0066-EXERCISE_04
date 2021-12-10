<?php


namespace App\Http\Services\Product;

use App\Http\Requests\Product\ProductRequest;
use App\Http\Services\UploadService;
use App\Models\Category;
use App\Models\Product;
use Illuminate\Support\Facades\Session;

class ProductAdminService
{
    public function getCategory()
    {
        return Category::where('active', 1)->get();
    }

    public function insert(ProductRequest $request)
    {
        try {
            $request->except('_token');
            if ($request->thumb) {
                $request->thumb = UploadService::uploadThumb($request->thumb);
            }
            $product = new Product();
            $product->name = $request->name;
            $product->category_id = $request->category_id;
            $product->price = $request->price;
            $product->active = $request->active;
            $product->description = $request->description;
            $product->content = $request->input('content');
            $product->thumb = $request->thumb;
            $product->save();
            Session::flash('success', 'Thêm Sản phẩm thành công');
        } catch (\Exception $err) {
            Session::flash('error', 'Thêm Sản phẩm lỗi');
            \Log::info($err->getMessage());

            return  false;
        }

        return  true;
    }

    public function get()
    {
        return Product::with('category')
            ->orderByDesc('id')->paginate(10);
    }

    public function update($request, $product)
    {
        try {
            $thumb = $request->thumb;
            if ($request->newThumb) {
                UploadService::deleteThumb($product->thumb);
                $thumb = UploadService::uploadThumb($request->newThumb);
            }
            $product->name = $request->name;
            $product->category_id = $request->category_id;
            $product->price = $request->price;
            $product->active = $request->active;
            $product->description = $request->description;
            $product->content = $request->input('content');
            $product->thumb = $thumb;
            $product->save();
            Session::flash('success', 'Cập nhật thành công');
        } catch (\Exception $err) {
            Session::flash('error', 'Có lỗi vui lòng thử lại');
            \Log::info($err->getMessage());
            return false;
        }
        return true;
    }

    public function delete($request)
    {
        $product = Product::where('id', $request->input('id'))->first();
        if ($product) {
            $product->delete();
            return true;
        }

        return false;
    }
}
