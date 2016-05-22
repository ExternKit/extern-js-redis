package;

import js.redis.Redis;

class RunTests {
	static function main() {
		var client = Redis.createClient();
		// client.unref();
		client.set('key', 'value');
		client.get('key', function(err, reply) trace(reply));
		client.incr('counter');
		client.get('counter', function(err, reply) trace(reply));
	}
}