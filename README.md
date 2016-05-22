# extern-js-redis [![Build Status](https://travis-ci.org/ExternKit/extern-js-redis.svg?branch=master)](https://travis-ci.org/ExternKit/extern-js-redis)

- **Target :** Javascript (NodeJS)
- **Library :** redis 
- **Last tested version :** 2.6.0
- **Available on :** [Github](https://github.com/NodeRedis/node_redis) - [NPM](https://www.npmjs.com/package/redis)

## Usage

```haxe
import js.redis.Redis;

class Main
{
  static function main()
  {
    var client = Redis.createClient();
    client.set('key', 'value');
    client.get('key', function(err, reply) trace(reply)); // 'value'
    client.incr('counter');
    client.get('counter', function(err, reply) trace(reply)); // '1'
  }
}
```
