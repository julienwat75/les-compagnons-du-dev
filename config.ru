require './app'

if memcache_servers = ENV["MEMCACHIER_SERVERS"]
  cache = Dalli::Client.new ENV['MEMCACHIER_SERVERS'], {
    username: ENV['MEMCACHIER_USERNAME'],
    password: ENV['MEMCACHIER_PASSWORD']}
  use Rack::Cache, verbose: true, metastore: cache, entitystore: cache, allow_reload: false
end

run Sinatra::Application
