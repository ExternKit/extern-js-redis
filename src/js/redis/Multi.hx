package js.redis;

import js.extern.Extern;
import js.extern.Callback;

@:externjs(namespace=true)
@:build(RedisMacro.buildMulti())
extern class Multi implements Extern<'redis'> {
	
	public function exec(?callback:Callback<Array<Dynamic>>):Void;
	public function execAtomic(?callback:Callback<Array<Dynamic>>):Void;
}