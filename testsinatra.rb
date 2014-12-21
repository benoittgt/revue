require 'sinatra/base'
require 'sinatra'
require 'mongo'
require 'json/ext'

include Mongo

Host     = ENV['MONGO_RUBY_DRIVER_HOST'] || 'localhost'
Port     = ENV['MONGO_RUBY_DRIVER_PORT'] || '27017'
Collname = ENV['MONGO_RUBY_DRIVER_COLL'] || 'revue-coll-spec'

configure do
  conn = MongoClient.new(Host,Port)
  set  :mongo_connection, conn
  set :mongo_db, conn.db('revue-db')
end

get '/' do
  content_type :json
  settings.mongo_db.collection_names.to_json
end

get '/documents/?' do
  content_type :json
  settings.mongo_db['revue-coll-spec'].find(nil, :fields => {
    :time => true,
    :nick => true,
    :message => true,
    :_id => false
  }).to_a.to_json
end

