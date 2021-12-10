<?php


namespace App\Helpers;

use App\Models\Category;
use Illuminate\Support\Str;

class Helper
{
    public static $html = '';

    public static function category($menus, $parent_id = 0, $char = '')
    {
        $html = '';

        foreach ($menus as $key => $menu) {
            if ($menu->parent_id == $parent_id) {
                $html .= '
                    <tr>
                        <td>' . $menu->id . '</td>
                        <td>' . $char . $menu->name . '</td>
                        <td>' . $menu->description . '</td>
                        <td>' . self::active($menu->active) . '</td>
                        <td>' . $menu->updated_at . '</td>
                        <td>
                            <a class="btn btn-primary btn-sm" href="/admin/categories/edit/' . $menu->id . '">
                                <i class="fas fa-edit"></i>
                            </a>
                            <a href="#" class="btn btn-danger btn-sm"
                                onclick="removeRow(' . $menu->id . ', \'/admin/categories/destroy\')">
                                <i class="fas fa-trash"></i>
                            </a>
                        </td>
                    </tr>
                ';

                unset($menus[$key]);

                $html .= self::category($menus, $menu->id, $char . '|--');
            }
        }

        return $html;
    }

    public static function active($active = 0): string
    {
        return $active == 0 ? '<span class="btn btn-danger btn-xs">NO</span>'
            : '<span class="btn btn-success btn-xs">YES</span>';
    }

    public static function menus($menus, $parent_id = 0) :string
    {
        $html = '';
        foreach ($menus as $key => $menu) {
            if ($menu->parent_id == $parent_id) {
                $html .= '
                    <li>
                        <a href="/danh-muc/' . $menu->id . '-' . Str::slug($menu->name, '-') . '.html">
                            ' . $menu->name . '
                        </a>';

                unset($menus[$key]);

                if (self::isChild($menus, $menu->id)) {
                    $html .= '<ul class="sub-menu">';
                    $html .= self::menus($menus, $menu->id);
                    $html .= '</ul>';
                }

                $html .= '</li>';
            }
        }

        return $html;
    }

    public static function isChild($menus, $id) : bool
    {
        foreach ($menus as $menu) {
            if ($menu->parent_id == $id) {
                return true;
            }
        }

        return false;
    }

    public static function CategoryRecusiveAdd($parent_id = 0, $sub_mark = '')
    {
        $data = Category::where('parent_id',$parent_id)->get();
            foreach ($data as $dataItem) {
                static::$html .= '<option  value="'.$dataItem->id.'">'. $sub_mark . $dataItem->name .'</option>';
            self::CategoryRecusiveAdd($dataItem->id,$sub_mark . '|--- ');
        }

        return static::$html;
    }

    public static function CategoryRecusiveEdit($parentIdMenuedit, $parent_id = 0, $sub_mark = '')
    {
        $data = Category::where('parent_id',$parent_id)->get();
        foreach ($data as $dataItem) {
            if ($parentIdMenuedit == $dataItem->id){
                static::$html .= '<option selected value="'.$dataItem->id.'">'. $sub_mark . $dataItem->name .'</option>';
            }else{
                static::$html .= '<option  value="'.$dataItem->id.'">'. $sub_mark . $dataItem->name .'</option>';
            }
            self::CategoryRecusiveEdit($parentIdMenuedit,$dataItem->id,$sub_mark . '|--- ');
        }

        return  static::$html;
    }
}
