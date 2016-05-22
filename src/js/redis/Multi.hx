package js.redis;

import js.extern.Extern;
import js.extern.Callback;

extern class Multi implements Extern<'redis'> implements RedisCommands {
	
	public function exec(callback:Callback<Array<Dynamic>>):Void;
	public function execAtomic(callback:Callback<Array<Dynamic>>):Void;
}