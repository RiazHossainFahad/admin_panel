<?php

namespace App\Http\Controllers;

use App\User;
use Illuminate\Http\Request;
use App\Http\Resources\UserResource;

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
        $request->validate([
            'name' => 'required',
            'email' => 'required',
            'roles' => 'required',
        ]);

        $user->name = $request->name;
        $user->email = $request->email;
        $user->save();
        $user->roles = $user->roles()->sync($request->roles);
        $success['success'] = "User info updated";
        $success['data'] = new UserResource(User::where('id', $user->id)->first());
        return response()->json([
            'success'=>$success
        ], $this->successStatus); 
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
