<?php

namespace Database\Seeders;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Schema;
use Spatie\Permission\Models\Role;
use App\Models\User;
use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Permission;

class CreateAdminUserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //super admin
        Schema::disableForeignKeyConstraints();
        DB::table('roles')->truncate();
        DB::table('role_has_permissions')->truncate();
        DB::table('role_has_permissions')->truncate();
        DB::table('model_has_permissions')->truncate();
        DB::table('model_has_roles')->truncate();
        User::whereIn('email',['admin@yopmail.com','company@yopmail.com','user@yopmail.com','superadmin@yopmail.com'])->delete();
        Schema::enableForeignKeyConstraints();
        $user = User::create([
            'name' => 'admin',
            'email' => 'admin@yopmail.com',
            'password' => Hash::make('12345678')
        ]);

        $role = Role::create(['name' => 'super-admin','guard_name'=>config('auth.defaults.guard')]);

        $permissions = Permission::pluck('id','id')->all();

        $role->syncPermissions($permissions);

        $user->assignRole([$role->id]);

        // company
        $user = User::create([
            'name' => 'company',
            'email' => 'company@yopmail.com',
            'password' => Hash::make('12345678')
        ]);

        $role = Role::create(['name' => 'company','guard_name'=>config('auth.defaults.guard')]);

        $permissions = Permission::whereIn('name',[ 'product-list',
            'product-create',
            'product-edit',
            'product-delete'])->pluck('id');

        $role->syncPermissions($permissions);
        $user->assignRole([$role->id]);

        $user = User::create([
            'name' => 'user',
            'email' => 'user@yopmail.com',
            'password' => Hash::make('12345678')
        ]);

        // Normal User
        $role = Role::create(['name' => 'user','guard_name'=>config('auth.defaults.guard')]);

        $permissions = Permission::whereIn('name',[ 'product-list'])->pluck('id');

        $role->syncPermissions($permissions);

        $user->assignRole([$role->id]);
    }
}
