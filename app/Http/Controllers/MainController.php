<?php

namespace App\Http\Controllers;

use App\Http\Services\Category\CategoryService;
use App\Http\Services\Product\ProductService;
use Illuminate\Routing\Controller;

class MainController extends Controller
{
    protected $category;
    protected $product;

    public function __construct(CategoryService $category,
        ProductService $product)
    {
        $this->category = $category;
        $this->product = $product;
    }

    public function index()
    {
        return view('front.home', [
            'categories' => $this->category->show(),
        ]);

    }

    public function search()
    {
        $keyword   = $_GET['search'];
        $categorys = $this->product->getSearchProductByCategory($keyword);

        return view('front.search', compact('categorys', 'keyword'));
    }

}
