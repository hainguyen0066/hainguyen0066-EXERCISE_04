<?php


namespace App\Http\Services\Product;


use App\Models\Category;
use App\Models\Product;

class ProductService
{
    const LIMIT = 10;

    public function get($page = null)
    {
        return Product::select('id', 'name', 'price', 'thumb')
            ->where('active', true)
            ->orderByDesc('id')
            ->when($page != null, function ($query) use ($page) {
                $query->offset($page * self::LIMIT);
            })
            ->limit(self::LIMIT)
            ->get();
    }

    public function getSearchProductByCategory($keyword)
    {
        return Category::where('name', 'LIKE', '%' . $keyword . '%')
            ->where('active', 1)
            ->with('childs')
            ->get();
    }

}
