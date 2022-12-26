<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\UserInfo;
use App\Models\RegisterMaster;
use App\Models\Signal;
use Illuminate\Support\Facades\DB;
use Barryvdh\Debugbar\Facades\Debugbar;
use Illuminate\Support\Collection;

class UserController extends Controller
{
    //
    public function index(){
        $user = User::with('info', 'bank', 'wallet')->get();
        dd($user);
    }
    public function create(){
        return DB::transaction(function () {
            $user = User::create([
                'username' => 'truong3',
                'phone' => '0999999996',
                'email' => 'truong3@gmail.com',
                'fullname' => "Tran Truong",
                'roles' => 'user',
                'avatar' => 'avatar',
                'password' => '123',
                'vip' => 0,
                'status' => 1,
                'win_rate' => 0,
                'identifier' => 'user'.time(),
                'referral_code' => 'RC'.time()
            ]);
            $user->info()->create([
                'gender' => 1,
                'birthday' => '1997-07-01',
            ]);
            $user->wallet()->create([
                'amount_deposit' => 0,
                'amount_follow' => 0,
                'amount_order' => 0,
                'amount_earning' => 0
            ]);
            $user->bank()->create([
                'bank_name' => 'VCB',
                'bank_user' => 'Tran Van Truong',
                'bank_number' => '1015645734'
            ]);
        });
    }
    public function registerMaster(){
        $m = RegisterMaster::find(1);
        // User::find($m->user_id)->update([
        //     'roles' => 'master'
        // ]);
        // UserInfo::whereId($m->user_id)->update($m->info->toArray());
        return view('index');
        // return RegisterMaster::create([
        //     'user_id' => 3,
        //     'info' => [
        //         'number_identity_card' => '221435463',
        //         'name_identity_card' => 'TRAN VAN TRUONG',
        //         'image_identity_card' => ['image1', 'image2']
        //     ],
        //     'status' => 0
        // ]);
    }

    public function signals(){
        // Debugbar::measure('Thoi gian xu ly: ', function() {
            // $users = User::whereRoles('master')->get();
            // $data = [];
            // foreach($users as $user){
            //     for($i = 507; $i <= 1007; $i++) {
            //         array_push($data, [
            //             'user_id' => $user->id,
            //             'title' => 'Tin hieu '.$i,
            //             'avatar' => 'avatar',
            //             'content' => 'content',
            //             'gallery' => 'gallery',
            //             'status' => rand(2,3),
            //         ]);
            //     }
            // }
            // Signal::insert($data);
            // dd(count($data));
            // foreach($users as $user){
            //     $user->signals()->insert($data);
            // }
        // });
        // $count = User::whereRoles('master')->with('signals')->get()->map(function($item) {
        //     $c = $item->signals;
        //     $item->update([
        //         'win_rate' => $c->where('status', 3)->count()*100/$c->count()
        //     ]);
        // });
        // User::find(7)->following()->attach($users, [
        //     'expired_at' => now()->addDays(30)
        // ]);
        // $user = User::find(7)->followings()->where('win_rate', '>=', 30)->pluck('id');
        // $signals = Signal::whereIn('user_id', $user)->get();
        // $user = User::lazy();
        Debugbar::measure('Thoi gian xu ly', function() {
            // Signal::chunkById(200, function ($flights) {
            //     $flights->each->update(['tag' => 'tag'.rand(1, 6)]);
            // }, $column = 'id');
            // $users = User::where('win_rate', '>=', 30)
            // ->orderBy('win_rate', 'DESC')
            // ->lazy(10);

            // $collect = Collection::make();
            // foreach($users as $user){
            //     $signals = $user->signals()->latest('id')->limit(10)->get();
            //     $collect = $collect->merge($signals);
            //     // dd($collect->count());
            //     if($collect->count() >= 10){
            //         $collect = $collect->slice(0, 10);
            //         break;
            //     }
            // }
            $user = User::find(3);
            $posts = Signal::whereBelongsTo($user)->get();
            // dd($signals);
            // dd($signals);
            // dd($users->toArray());
            // dd($count);
            // $signals = Signal::select('id', 'title')->latest('id')->whereIn('user_id', $user)->get();
            // dd($signals->toArray());
        });
        
        // $user->transactions()->create([
        //     'type' => 1,
        //     'amount' => 1000000,
        //     'fee' => 0,
        //     'detail' => 'Nap tien'
        // ]);
        // $user->wallet()->update(['amount_deposit' => 1000000]);
        // $user->fill(['vip1' => 2]);
        // dd($user->followings[0]->info->toArray());
        return view('index');
    }
}
