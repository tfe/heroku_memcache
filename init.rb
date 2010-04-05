if ENV['MEMCACHE_SERVERS']
  require 'memcache'
  servers = ENV['MEMCACHE_SERVERS'].split(',')
  namespace = ENV['MEMCACHE_NAMESPACE']
  $heroku_memcache = MemCache.new(servers, :namespace => namespace)
end
