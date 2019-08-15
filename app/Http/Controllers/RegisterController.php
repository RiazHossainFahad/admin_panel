<?php

namespace App\Http\Controllers;

use App\Role;
use App\User;
use Illuminate\Http\Request;
use App\Http\Requests\InsertRequest;
use App\Http\Resources\RoleResource;
use Illuminate\Support\Facades\Validator;

class RegisterController extends Controller
{
    private $successStatus = 200;
    public function index(InsertRequest $req){
        $input = $req->all(); 
        $input['password'] = bcrypt($input['password']); 
        $user = User::create($input);
        // $success['token'] =  $user->createToken('MyApp')-> accessToken; 
        $success['msg'] =  'Success';
        $success['data'] =  $user;
        return response()->json(['success'=>$success], $this->successStatus); 
    }

    public function getRole(){
        return RoleResource::collection(Role::all());
    }
}
