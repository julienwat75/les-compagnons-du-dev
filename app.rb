require 'bundler'
Bundler.require :default, (ENV["RACK_ENV"] || "development").to_sym

get '/' do
  cache_control :public, max_age: 1800
  haml :index
end
