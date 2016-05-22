package js.redis;

import js.node.events.EventEmitter;
import js.extern.Extern;
import js.extern.Callback;

@:externjs(namespace=true)
@:build(RedisMacro.buildClient())
extern class RedisClient extends EventEmitter<RedisClient> implements Extern<'redis'> {
	
	public var connected:Bool;
	public var commandQueueLength:Int;
	public var offlineQueueLength:Int;
	
	
	public function auth(password:String, ?callback:Callback<Dynamic>):Dynamic;
	public function quit():Dynamic;
	public function end(flush:Bool):Dynamic;
	public function unref():Dynamic;
	public function multi():Multi;
	
	public function sendCommand(commandName:String, ?args:Dynamic, ?callback:Callback<Dynamic>):Void;
	
	public function duplicate(?options:RedisClientOptions, ?callback:Callback<Dynamic>):RedisClient;
}

typedef RedisClientOptions = {
	?host:String,
	?port:Int,
	?path:String,
	?url:String,
	?parser:Dynamic,
	?stringNumbers:Bool,
	?returnBuffers:Bool,
	?detectBuffers:Bool,
	?socketKeepalive:Bool,
	?noReadyCheck:Bool,
	?enableOfflineQueue:Bool,
	?retryMaxDelay:Int, // milliseconds
	?connectTimeout:Int,
	?maxAttempts:Int,
	?retryUnfulfilledCommands:Bool,
	?password:String,
	?db:String,
	?family:String,
	?disableResubscribing:Bool,
	?renameCommands:Dynamic,
	?tls:Dynamic,
	?prefix:String,
	?retryStrategy:Dynamic->Dynamic,
}