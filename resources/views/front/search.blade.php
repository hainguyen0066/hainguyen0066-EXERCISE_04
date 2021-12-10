@extends('main')

@section('content')
    <!-- Product -->
    <section class="bg0 p-t-23 p-b-140">
        <div class="container">
            @if(count($categorys) > 0)
                <div class="p-b-10">
                    <h3 class="ltext-103 cl5">
                        PRODUCT OVER VIEW
                    </h3>
                    <h3 class="ltext-103 cl5">
                        TIM THẤY SẢN PHẨM VỚI TỪ KHOÁ : "{{ $keyword }}"
                    </h3>
                </div>
                @foreach($categorys as $category)
                    @include('products.list', ['products' => $category->products])
                    @if($category->childs)
                        @foreach($category->childs as $child)
                            @include('products.list', ['products' => $child->products])
                        @endforeach
                    @endif
                @endforeach
            @else
                <h3 class="ltext-103 cl5">
                    KHÔNG TÌM THẤY SẢN PHẨM VỚI TỪ KHOÁ ... "{{ $keyword }}"
                </h3>
            @endif
        </div>
    </section>
@endsection
