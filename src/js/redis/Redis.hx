package js.redis;

import js.redis.RedisClient;
import js.extern.Extern;

extern class Redis implements Extern<'redis'> {
	
	public static function createClient(?options:RedisClientOptions):RedisClient;
	
}

