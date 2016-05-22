package js.redis;

import js.node.events.EventEmitter;
import js.extern.Extern;
import js.extern.Callback;

@:externjs(namespace=true)
extern class RedisClient extends EventEmitter<RedisClient> implements Extern<'redis'> implements RedisCommands {
	
	public var connected:Bool;
	public var commandQueueLength:Int;
	public var offlineQueueLength:Int;
	
	public function auth(password:String, ?callback:Callback<Dynamic>):Dynamic;
	public function quit():Dynamic;
	public function end(flush:Bool):Dynamic;
	public function unref():Dynamic;
	
	public function sendCommand(commandName:String, ?args:Dynamic, ?callback:Callback<Dynamic>):Void;
	
	public function duplicate(?options:RedisClientOptions, ?callback:Callback<Dynamic>):RedisClient;
}

typedef RedisClientOptions = {
	host:String,
	port:Int,
	path:String,
	url:String,
	parser:Dynamic,
	string_numbers:Bool,
	return_buffers:Bool,
	detect_buffers:Bool,
	socket_keepalive:Bool,
	no_ready_check:Bool,
	enable_offline_queue:Bool,
	retry_max_delay:Int, // milliseconds
	connect_timeout:Int,
	max_attempts:Int,
	retry_unfulfilled_commands:Bool,
	password:Dynamic,
	db:Dynamic,
	family:String,
	disable_resubscribing:Bool,
	rename_commands:Dynamic,
	tls:Dynamic,
	prefix:String,
	retry_strategy:Dynamic->Dynamic,
}