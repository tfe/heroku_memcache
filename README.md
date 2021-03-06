[`heroku_memcache`](http://github.com/tfe/heroku_memcache/)
========

Sets a global variable `$heroku_memcache` which you can then use anywhere in your app to access the Heroku-managed memcache cluster. If the app is not running on Heroku, this variable won't be defined and you should make other arrangements (see "Usage" below).

Note that if you are only going to use memcache through the `Rails.cache` methods (using `config.cache_store = :mem_cache_store`), you should just follow the [Heroku documentation](http://docs.heroku.com/memcache) and *not install this plugin*. Only install this if you need direct access to memcache for something specific (e.g. [`cache_money`](http://github.com/nkallen/cache-money)). Also take care not to cause cache key collisions if you have multiple things/plugins accessing your app's namespace on the Heroku memcache cluster.


Installation
------------

	script/plugin install git://github.com/tfe/heroku_memcache.git


Usage
-----

I have something like the following in `initializers/memcache_config.rb`:

	MEMCACHE = if $heroku_memcache
	  $heroku_memcache
	else
	  require 'memcache'
	  MemCache.new('localhost')
	end

If you don't want to run memcache on your development machine, you can probably get away with using an in-memory hash. Just replace `MemCache.new('localhost')` in the above with `{}`. It will behave the same for basic usage.


Credit
------

This is pretty much straight out of the Heroku memcache private beta docs.


Contact
-------

Problems, comments, and pull requests all welcome. [Find me on GitHub.](http://github.com/tfe/)


License
-------

**The MIT License**

Copyright © 2010 [Todd Eichel](http://toddeichel.com/) for [Fooala, Inc.](http://opensource.fooala.com/).

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the ‘Software’), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED ‘AS IS’, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
