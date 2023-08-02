<?php

namespace Database\Seeders;

use App\Models\Role;
use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;
use Spatie\Permission\Models\Permission;

class PermissionTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Schema::disableForeignKeyConstraints();
    DB::table('permissions')->truncate();
    DB::table('roles')->truncate();
    DB::table('role_has_permissions')->truncate();
    DB::table('model_has_permissions')->truncate();
    DB::table('model_has_roles')->truncate();
        User::whereIn('email',['superadmin@yopmail.com','admin@yopmail.com','user@yopmail.com'])->delete();
        Schema::enableForeignKeyConstraints();
        $permissions = [
            'role-list',
            'role-create',
            'role-edit',
            'role-delete',
            'product-list',
            'product-create',
            'product-edit',
            'product-delete',
            'user-list',
            'user-create',
            'user-edit',
            'user-delete',

        ];

        foreach ($permissions as $permission) {
            Permission::create(['name' => $permission]);
        }
    }
}
