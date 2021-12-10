<?php


namespace App\Http\Services\Category;


use App\Helpers\Helper;
use App\Models\Category;
use Illuminate\Support\Facades\Session;

class CategoryService
{
    public function getParent()
    {
        return Category::where('parent_id', 0)->get();
    }

    public function show()
    {
        return Category::select('name', 'id')
            ->where('parent_id', '=', 0)
            ->orderbyDesc('created_at')
            ->with('childs')->get();
    }

    public function getAll()
    {
        return Category::orderbyDesc('id')->paginate(20);
    }

    public function create($request)
    {
        try {
            Category::create([
                'name' => (string)$request->input('name'),
                'parent_id' => (int)$request->input('parent_id'),
                'description' => (string)$request->input('description'),
                'content' => (string)$request->input('content'),
                'active' => (string)$request->input('active')
            ]);

            Session::flash('success', 'Tạo Danh Mục Thành Công');
        } catch (\Exception $err) {
            Session::flash('error', $err->getMessage());
            return false;
        }

        return true;
    }

    public function update($request, $menu): bool
    {
        if ($request->input('parent_id') != $menu->id) {
            $menu->parent_id = (int)$request->input('parent_id');
        }

        $menu->name = (string)$request->input('name');
        $menu->description = (string)$request->input('description');
        $menu->content = (string)$request->input('content');
        $menu->active = (string)$request->input('active');
        $menu->save();

        Session::flash('success', 'Cập nhật thành công Danh mục');
        return true;
    }

    public function destroy($request)
    {
        $id = (int)$request->input('id');
        $menu = Category::where('id', $id)->first();
        if ($menu) {
            return Category::where('id', $id)->orWhere('parent_id', $id)->delete();
        }

        return false;
    }


    public function getId($id)
    {
        return Category::where('id', $id)->where('active', 1)->firstOrFail();
    }


    public function getCategoryOptionAdd()
    {
        return Helper::CategoryRecusiveAdd();
    }

    public function getCategoryRecusiveEdit($parent)
    {
        return Helper::CategoryRecusiveEdit($parent);
    }
}
