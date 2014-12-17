require 'sinatra'
require 'mongo'
require 'json/ext'

include Mongo

Host     = ENV['MONGO_RUBY_DRIVER_HOST'] || 'localhost'
Port     = ENV['MONGO_RUBY_DRIVER_PORT'] || '27017'
Collname = ENV['MONGO_RUBY_DRIVER_COLL'] || 'revue-coll-spec'

configure do
  conn = MongoClient.new(host,port)
  set  :mongo_connection, conn
  set :mongo_db, conn.db('revue-db')
end
  #collection(collname)
