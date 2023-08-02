<?php

namespace App\Http\Middleware;

use App\Models\UserVerify;
use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Str;

class IsVerifyEmail
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next)
    {
        if (!Auth::user()->is_email_verified) {
            $user = Auth::user();
            auth()->logout();
            $token = Str::random(64);

            UserVerify::create([
                'user_id' => $user->id,
                'token' => $token
            ]);

            Mail::send('emails.emailVerification', ['token' => $token], function($message) use($user){
                $message->to($user->email);
                $message->subject('Email Verification Mail');
            });
            return redirect()->route('login')
                ->with('message', 'You need to confirm your account. We have sent you an activation code, please check your email.');
        }

        return $next($request);
    }
}
