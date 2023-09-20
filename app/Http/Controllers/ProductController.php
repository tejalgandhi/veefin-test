<?php

namespace App\Http\Controllers;

use App\Models\PaymentCard;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Stripe\Stripe;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    function __construct()
    {
        Stripe::setApiKey(env('STRIPE_SECRET'));

        $this->middleware('permission:product-list|product-create|product-edit|product-delete', ['only' => ['index', 'show']]);
        $this->middleware('permission:product-create', ['only' => ['create', 'store']]);
        $this->middleware('permission:product-edit', ['only' => ['edit', 'update']]);
        $this->middleware('permission:product-delete', ['only' => ['destroy']]);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $products = Product::latest();
        if (Auth::user()->hasRole('company')) {
            $products = $products->where('created_by', Auth::user()->id);
        }
        $products = $products->paginate(5);
        return view('products.index', compact('products'))
            ->with('i', (request()->input('page', 1) - 1) * 5);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('products.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        request()->validate([
            'name' => 'required',
            'detail' => 'required',
            'image' => 'required',
            'price' => 'required',
        ]);

        $product = Product::create($request->all());
        $product->uploadFile('image', $request->image, ['products']);
        return redirect()->route('products.index')
            ->with('success', 'Product created successfully.');
    }

    /**
     * Display the specified resource.
     *
     * @param \App\Product $product
     * @return \Illuminate\Http\Response
     */
    public function show(Product $product)
    {
        return view('products.show', compact('product'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param \App\Product $product
     * @return \Illuminate\Http\Response
     */
    public function edit(Product $product)
    {
        return view('products.edit', compact('product'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param \App\Product $product
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Product $product)
    {
        request()->validate([
            'name' => 'required',
            'detail' => 'required',
            'image' => 'required',
            'price' => 'required',
        ]);

        $product->update($request->all());
        $product->uploadFile('image', $request->image, ['products']);

        return redirect()->route('products.index')
            ->with('success', 'Product updated successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param \App\Product $product
     * @return \Illuminate\Http\Response
     */
    public function destroy(Product $product)
    {
        $product->delete();

        return redirect()->route('products.index')
            ->with('success', 'Product deleted successfully');
    }

    public function getBuyProduct(Request $request, Product $product)
    {
        return view('products.buy-product', compact('product'));
    }

    public function buyProduct(Request $request)
    {
        $validated = $request->validate([
            'stripeToken' => 'required'
        ]);

        $token = $request->input('stripeToken');

        if (!Auth::user()) {
            return redirect('Unauthorized', 401);
        }
        $this->user = Auth::user();
        if (!$this->user->stripe_id) {

            // Create a Stripe customer
            $this->customer = \Stripe\Customer::create(array(
                "email" => Auth::user()->email,
            ));

            // Set the Stripe id for our user
            $this->user->stripe_id = $this->customer->id;
            $this->user->save();

            $card = \Stripe\Customer::createSource(
                $this->customer->id,
                [
                    'source' => $token,
                ]
            );


            $system_card = PaymentCard::create([
                'token' => $card->id,
                'is_default' => '1',
                'brand' => $card->brand,
                'cvc' => $card->cvc,
                'exp_month' => $card->exp_month,
                'exp_year' => $card->exp_year,
                'last4' => $card->last4
            ]);
        } else {
            $this->customer = \Stripe\Customer::retrieve(Auth::user()->stripe_id);
            $card = \Stripe\Customer::createSource(
                $this->customer->id,
                [
                    'source' => $token,
                ]
            );
            $this->customer->save();

            $system_card = PaymentCard::create([
                'user_id' => Auth::user()->id,
                'token' => $card->id,
                'is_default' => '0',
                'brand' => $card->brand,
                'cvc' => $card->cvc,
                'exp_month' => $card->exp_month,
                'exp_year' => $card->exp_year,
                'last4' => $card->last4
            ]);
        }

        $charge = \Stripe\PaymentIntent::create([
            'amount' => $request->price * 100,
            'currency' => 'usd',
            'customer' => $this->customer->id,
            'source' => $card->id,
        ]);

        return redirect()->route('buy-product.get', $request->id)
            ->with('success', 'Payment successfully');

    }
}
