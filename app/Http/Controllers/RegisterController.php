<?php

namespace App\Http\Controllers;

use App\Http\Resources\RoleResource;
use App\Role;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class RegisterController extends Controller
{
    private $successStatus = 200;
    public function index(Request $req){
        $validator = Validator::make($req->all(), [ 
            'name' => 'required', 
            'email' => 'required|email', 
            'password' => 'required|min:4', 
            'confirm_password' => 'required|same:password', 
        ]);
        if ($validator->fails()) { 
                    return response()->json(['error'=>$validator->errors()], 401);            
                }
        $input = $req->all(); 
                $input['password'] = bcrypt($input['password']); 
                $user = User::create($input);
                $success['token'] =  $user->createToken('MyApp')-> accessToken; 
                $success['data'] =  $user;
        return response()->json(['success'=>$success], $this->successStatus); 
    }

    public function getRole(){
        return RoleResource::collection(Role::all());
    }
}
