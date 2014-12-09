require 'mongo'

include Mongo

host     = ENV['MONGO_RUBY_DRIVER_HOST'] || 'localhost'
port     = ENV['MONGO_RUBY_DRIVER_PORT'] || MongoClient::DEFAULT_PORT
collname = ENV['MONGO_RUBY_DRIVER_COLL'] || 'revue-coll-spec'

class Revuelog
  attr_reader :time, :nick, :message

  def initialize(time, nick, message)
    @time    = time
    @nick    = nick
    @message = message
  end

  def to_hash
     {"time" => @time, "nick" => @nick, "message" => @message}
  end
end

class Mongodb

  def initialize(host, port, collname)
    db = MongoClient.new(host,port).db('revue-db')
    @coll = db[collname]
  end

  def find(key, value)
    @coll.find({key => value}, :fields => [key]).to_a
  end

  def distinct(key)
    @coll.distinct(key).to_a
  end

  def dbinsert(revuehash)
    @coll.insert(revuehash)
  end

  def dbclean
    @coll.drop
  end
end


