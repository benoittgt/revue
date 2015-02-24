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
  send_file 'index.html'
end

get '/logs' do
  content_type :json
  settings.mongo_db[Collname].find(nil, :fields => {
    :time => true,
    :nick => true,
    :message => true,
    :_id => false
  }).limit(150).sort({ _id: -1 }).to_a.to_json
end

get '/most_active' do
  content_type :json
  group ={"$group" => { "_id" => "$nick", "value" => {"$sum" => 1} }}
  sort = {"$sort" => {"value" => -1}}
  limit = {"$limit" => 15}

  settings.mongo_db[Collname].aggregate([group,sort,limit]).to_json
end

not_found do
  content_type :json
  halt 404, { error: 'URL not found' }.to_json
end

