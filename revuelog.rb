require 'mongo'



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

class Revuedb

include Mongo

  Host     = ENV['MONGO_RUBY_DRIVER_HOST'] || 'localhost'
  Port     = ENV['MONGO_RUBY_DRIVER_PORT'] || '27017'
  Collname = ENV['MONGO_RUBY_DRIVER_COLL'] || 'revue-coll-spec'

  def initialize(host=Host, port=Port, collname=Collname)
    @coll = MongoClient.new(host,port).db('revue-db').collection(collname)
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


