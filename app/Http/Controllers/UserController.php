<?php

namespace App\Http\Controllers;

use App\User;
use Illuminate\Http\Request;
use App\Http\Resources\UserResource;
use Illuminate\Support\Facades\Validator;

class UserController extends Controller
{
    private $successStatus = 200;
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // $users = User::with('roles')->get();
        // $success['data'] =  $users;
        // $success['status'] = $this->successStatus;
        // return response()->json(['success'=>$success], $this->successStatus); 
        return UserResource::collection(User::all());
    }

     /**
     * Store a new user of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function store(Request $req){
        $validator = Validator::make($req->all(), [ 
            'name' => 'required', 
            'email' => 'required|email', 
            'password' => 'required|min:4', 
            'confirm_password' => 'required|same:password', 
            'roles' => 'required',
        ]);
        if ($validator->fails()) { 
            return response()->json(['error'=>$validator->errors()], 401);            
        }
        $user = new User();
        $user->name = $req->name;
        $user->email = $req->email;
        $user->password = bcrypt($req->password); 
        $user->save();

        $user->roles()->attach($req->roles);
        $success['token'] =  $user->createToken('MyApp')-> accessToken; 
        $success['data'] = new UserResource(User::where('id', $user->id)->first());
        return response()->json(['success'=>$success], $this->successStatus); 
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(User $user)
    {
        // return $user;
        return new UserResource(User::where('id', $user->id)->first());
        // return response()->json(['data'=>$user], $this->successStatus); 
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, User $user)
    {
        if($request->has('name'))
        $user->name = $request->name;
        if($request->has('email'))
        $user->email = $request->email;

        $user->save();

        if($request->has('roles'))
        $user->roles = $user->roles()->sync($request->roles);
        $success['success'] = "User info updated";
        $success['data'] = new UserResource(User::where('id', $user->id)->first());
        return response()->json(['success'=>$success], $this->successStatus); 
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(User $user)
    {
        $user->delete();
        // $user->roles()->delete();
        $success['success'] = "User deleted!!";
        $success['data'] = [];
        return response()->json(['success'=>$success], $this->successStatus); 
    }
}
