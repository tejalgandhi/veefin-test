<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Laravel\Socialite\Facades\Socialite;

class SocialiteController extends Controller
{
    public function redirect($service) {
        return Socialite::driver($service)->redirect ();
    }
    public function callback($service) {
        $user = Socialite::with ( $service )->user ();
//        return view ( 'home' )->withDetails ( $user )->withService ( $service );

        if($service == 'google') {
            $data = $this->handleGoogleCallback($user);

        }else{
            $data = $this->handleFacebookCallBack($user);
        }
        if($data){
            Auth::login($data);
            return view ( 'home' )->withDetails ( $user )->withService ( $service );
        }else{
            return redirect()->route('login')
                ->with('error', 'Something Went Wrong');

        }

    }

    public function handleGoogleCallback($user){

        $finduser = User::where('google_id', $user->id)->first();

        if($finduser){
                return $finduser;

        }else{
            $newUser = User::updateOrCreate(['email' => $user->email],[
                'name' => $user->name,
                'google_id'=> $user->id,
                'password' => encrypt('123456'),
                'is_email_verified' => User::EMAIL_VERIFY,
            ]);
            return $newUser;
        }

        return false;

    }

    public function handleFacebookCallBack($user){
        $finduser = User::where('facebook_id', $user->id)->first();

        if($finduser){

            return $finduser;


        }else{
            $newUser = User::updateOrCreate(['email' => $user->email],[
                'name' => $user->name,
                'facebook_id'=> $user->id,
                'password' => encrypt('123456dummy'),
                'is_email_verified' => User::EMAIL_VERIFY,
            ]);
            return $newUser;


        }
        return false;

    }
}


