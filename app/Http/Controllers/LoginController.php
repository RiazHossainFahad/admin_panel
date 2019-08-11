<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    private $successStatus = 200;
    
    public function index(Request $req){
        if(Auth::attempt(['email' => request('email'), 'password' => request('password')])){ 
            $user = Auth::user(); 
            $success['data'] =  $user; 
            $success['token'] =  $user->createToken('MyApp')->accessToken; 
            return response()->json(['success' => $success], $this->successStatus); 
        } 
        else{
            return response()->json(['error'=>'Unauthorised'], 401); 
        } 
    }

    public function logoutApi()
    { 
        if (Auth::check()) {
            Auth::user()->AauthAcessToken()->delete();
            return response()->json(['success' => 'Logout Successful'], $this->successStatus);             
        }
        else{
            return response()->json(['error'=>'Something went wrong.'], 401); 
        } 
    }
}
