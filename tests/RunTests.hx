package;

import haxe.Json;
import js.redis.Redis;

class RunTests {
	static function main() {
		var client = Redis.createClient();
		
		client.set('key', 'value');
		client.get('key', function(err, reply) trace(Json.stringify(reply)));
		
		client.incr('counter', function(err, reply) trace(Json.stringify(reply)));
		client.get('counter', function(err, reply) trace(Json.stringify(reply)));
		
		client.hmset('hash', {a:1, b:2});
		client.hgetall('hash', function(err, reply) trace(Json.stringify(reply)));
		client.hget('hash', 'a', function(err, reply) trace(Json.stringify(reply)));
		
		client.multi()
			.set('multi', 'value')
			.set('multi2', 'value')
			.exec();
		client.get('multi', function(err, reply) trace(Json.stringify(reply)));
		client.get('multi2', function(err, reply) trace(Json.stringify(reply)));
	}
}