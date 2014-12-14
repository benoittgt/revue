require 'mongo'
require 'cinch'
require 'json'

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

  def findlastone
     @coll.find().sort("_id", -1).limit(1).to_a.to_json
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

module Cinch::Plugins
  class Revue
    include Cinch::Plugin

    @@db = Revuedb.new

    match /(...)/, use_prefix: false, method: :log 
    def log(m)
      bot.debug("RevueLog :: New Message : Time is : #{m.time}, nick is #{m.user.nick}, message is #{m.message}")
      loghash = Revuelog.new(m.time, m.user.nick, m.message).to_hash

      @@db.dbinsert(loghash)

      lastentry = @@db.findlastone
      bot.("RevueLog :: New database entry : #{lastentry}")
    end
  end
end
