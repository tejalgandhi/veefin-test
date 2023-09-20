@extends('layouts.app')


@section('content')
    <div class="row">
        <div class="col-lg-12 margin-tb">
            <div class="pull-left">
                <h2>Products</h2>
            </div>
            <div class="pull-right">
                @can('product-create')
                    <a class="btn btn-success" href="{{ route('products.create') }}"> Create New Product</a>
                @endcan
            </div>
        </div>
    </div>


    @if ($message = Session::get('success'))
        <div class="alert alert-success">
            <p>{{ $message }}</p>
        </div>
    @endif


    <table class="table table-bordered">

        @if(count($products) > 0)
        @foreach ($products as $product)
                <div class="container mt-5 mb-5">
                    <div class="d-flex justify-content-center row">
                        <div class="col-md-10">
                            <div class="row p-2 bg-white border rounded">
                                <div class="col-md-3 mt-1">
                                    <img src="{{ asset('/storage/'.$product->image) }}" alt="Card image cap"  class="img-fluid img-responsive rounded product-image">
                                </div>
{{--                                    <img class="img-fluid img-responsive rounded product-image" src="https://i.imgur.com/QpjAiHq.jpg"></div>--}}
                                <div class="col-md-6 mt-1">
                                    <h5>{{ $product->name }}</h5>

                                    <div class="mt-1 mb-1 spec-1">{{ $product->detail }}</div>
                                  </div>
                                <div class="align-items-center align-content-center col-md-3 border-left mt-1">
                                    <div class="d-flex flex-row align-items-center">
                                        <h4 class="mr-1">${{$product->price}}</h4>
                                    </div>
                                    <h6 class="text-success">Free shipping</h6>
                                    <div class="d-flex flex-column mt-4 p-2">
                                        <form action="{{ route('products.destroy',$product->id) }}" method="POST">

                                           @if($product->created_by == \Illuminate\Support\Facades\Auth::user()->id)
                                           @can('product-edit')
                                                <a class="btn btn-primary mt-2" href="{{ route('products.edit',$product->id) }}">Edit</a>
                                            @endcan
                                               <a class="btn btn-info mt-2" href="{{ route('products.show',$product->id) }}">Details</a>

                                            @csrf
                                            @method('DELETE')

                                            @can('product-delete')
                                                <button type="submit" class="btn btn-danger mt-2">Delete</button>
                                            @endcan
                                            @endif

                                        </form>
                                        @role('user')
                                            <a href="{{ route('buy-product.get',$product->id) }}" class="btn btn-outline-primary btn-sm mt-2" type="button">Buy Product</a>
                                        @endrole
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

        @endforeach
        @else
            <tr aria-rowspan="4">
                <td>
            No Products Found.
                </td>
            </tr>
        @endif
    </table>


    {!! $products->links() !!}


@endsection
