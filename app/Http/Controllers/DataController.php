<?php

namespace App\Http\Controllers;

use App\Exports\UsersExport;
use App\Role;
use App\User;
use Illuminate\Http\Request;
use Maatwebsite\Excel\Facades\Excel;
use Symfony\Component\HttpFoundation\Response;

class DataController extends Controller
{
    public function import(Request $req){
        $data = array();
        if($req->hasFile('file')){
            $file = $req->file('file');
            $fn = $file->getClientOriginalName();
            $ext = $file->getClientOriginalExtension();
            if ($ext == 'csv') {
            $path = $req->file('file')->getRealPath();

            if ($req->has('header')) {
                $csv_data = Excel::load($path, function ($reader) {
                })->get()->toArray(); //it returns data as ( key => value ) structure
            } else {
                $csv_data = array_map('str_getcsv', file($path)); //it returns data as ( value ) structure
            }

            if (count($csv_data) > 0) {
                // $data['data'] = $csv_data;
                if(strpos($csv_data[1][1], '="') === false){
                    $this->importFromDefaultFormat($csv_data);
                    // $data['err'] = 'error';
                }else{
                for ($i=1; $i < count($csv_data); $i++) { 
                    // split individual index for 'actual data' from '="data"' format
                    
                    $tmp_name =explode('"',$csv_data[$i][1]);
                    $tmp_email=explode('"',$csv_data[$i][2]);
                    $tmp_password=explode('"',$csv_data[$i][3]);
                    $tmp_roles=explode('"',$csv_data[$i][4]);

                    $role_id = [];


                    $user = User::where('email', $tmp_email[1])->first();
                    if($user){
                        $user_id = $user->id;
                        // $data['data'] = $user_id;
                        $role_id = $this->getRoles($tmp_roles[1]);
                        $user->roles()->sync($role_id);
                        // $data[$i]['role'] = $role_id;
                    }else{
                        $new_user = new User();
                        $new_user->name = $tmp_name[1];
                        $new_user->email = $tmp_email[1];
                        $new_user->password = $tmp_password[1];
                        $new_user->save();
                        $user_id = $new_user->id;
                        
                        // update role
                        // get the roles id from db 
                        $role_id = $this->getRoles($tmp_roles[1]);

                        $new_user->roles()->sync($role_id);  
                    }
                }
                }
                $data['success'] = 'Data imported';
            }else{
                $data['error'] = 'Empty CSV file!';
            }

            }else{
                $data['error'] = 'File not supported!';
            }
        }else{
            $data['error'] = 'No file Found';
        }
        return response([
            'data' => $data
        ], Response::HTTP_CREATED);
    }

    public function getRoles($tmp_roles){
        $role_id = [];
        if(strpos($tmp_roles, ",")){
            $roles = explode(',', $tmp_roles);
            for ($i=0; $i < count($roles); $i++) { 
                $role = Role::where('name', $roles[$i])->first();
                if($role){
                    $role_id[] = $role->id;
                }else{
                    $role = new Role();
                    $role->name = $roles[$i];
                    $role->save();
                    $role_id[] = $role->id;
                }
            }
        }else{
            $roles = $tmp_roles;
            $role = Role::where('name', $roles)->first();
                if($role){
                    $role_id[] = $role->id;
                }else{
                    $role = new Role();
                    $role->name = $roles;
                    $role->save();
                    $role_id[] = $role->id;
                }
        }
        return $role_id;
    }

    public function importFromDefaultFormat($csv_data){
        for ($i=1; $i < count($csv_data); $i++) { 
            // split individual index for 'actual data' from '="data"' format
            
            $tmp_name = $csv_data[$i][1];
            $tmp_email= $csv_data[$i][2];
            $tmp_password= $csv_data[$i][3];
            $tmp_roles= $csv_data[$i][4];

            $role_id = [];


            $user = User::where('email', $tmp_email)->first();
            if($user){
                $user_id = $user->id;
                // $data['data'] = $user_id;
                $role_id = $this->getRoles($tmp_roles);
                $user->roles()->sync($role_id);
                // $data[$i]['role'] = $role_id;
            }else{
                $new_user = new User();
                $new_user->name = $tmp_name;
                $new_user->email = $tmp_email;
                $new_user->password = $tmp_password;
                $new_user->save();
                $user_id = $new_user->id;
                
                // update role
                // get the roles id from db 
                $role_id = $this->getRoles($tmp_roles);

                $new_user->roles()->sync($role_id);  
            }
        }
    }

    public function export(){
        return Excel::download(new UsersExport, 'users.xlsx');
    }
}
