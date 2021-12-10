@extends('main')

@section('content')
    <!-- Product -->
    <section class="bg0 p-t-23 p-b-140">
        <div class="container">
            <div class="p-b-10">
                <h3 class="ltext-103 cl5">
                    Product Overview
                </h3>
            </div>

           @foreach($categories as $category)
                <div class="flex-w flex-sb-m p-b-52">
                    <div class="flex-w flex-l-m filter-tope-group m-tb-10">
                        <button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 how-active1" data-filter="*">
                            {{ $category->name }}
                        </button>
                    </div>
                </div>
                <div id="loadProduct">
                    @if(!empty($category->products))
                        @include('products.list', ['products' => $category->products])
                    @endif
                </div>
                @if(!empty($category->childs))
                    @foreach($category->childs as $child)
                        <div style="margin-left: 50px" class="flex-w flex-sb-m p-b-52">
                            <div class="flex-w flex-l-m filter-tope-group m-tb-10">
                                <button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 how-active1" data-filter="*">
                                     + {{ $child->name }}
                                </button>
                            </div>
                        </div>
                        <div id="loadProduct">
                            @if(!empty($child->products))
                                @include('products.list', ['products' => $child->products])
                            @endif
                        </div>
                    @endforeach
                @endif


            @endforeach


        </div>
    </section>
@endsection
