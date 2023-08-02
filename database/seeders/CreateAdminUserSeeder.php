<?php

namespace Database\Seeders;

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

        $user = User::create([
            'name' => 'Super Admin',
            'email' => 'superadmin@yopmail.com',
            'password' => bcrypt('12345678')
        ]);

        $role = Role::create(['name' => 'super-admin','guard_name'=>config('auth.defaults.guard')]);

        $permissions = Permission::pluck('id','id')->all();

        $role->syncPermissions($permissions);

        $user->assignRole([$role->id]);

        // Admin
        $user = User::create([
            'name' => 'Admin',
            'email' => 'admin@yopmail.com',
            'password' => bcrypt('12345678')
        ]);

        $role = Role::create(['name' => 'admin','guard_name'=>config('auth.defaults.guard')]);

        $permissions = Permission::whereNotIn('name',['role-list',
            'role-create',
            'role-edit',
            'role-delete'])->pluck('id');

        $role->syncPermissions($permissions);
        $user->assignRole([$role->id]);

        $user = User::create([
            'name' => 'user',
            'email' => 'user@yopmail.com',
            'password' => bcrypt('12345678')
        ]);

        // Normal User
        $role = Role::create(['name' => 'user','guard_name'=>config('auth.defaults.guard')]);

        $permissions = Permission::whereIn('name',[ 'product-list',
            'product-create',
            'product-edit',
            'product-delete'])->pluck('id');

        $role->syncPermissions($permissions);

        $user->assignRole([$role->id]);
    }
}
