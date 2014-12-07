require './spec/spec_helper'
require 'mongo'

include Mongo

class MongodbSpec

  attr_reader :key, :value, :revuehash

  def self.dbnew
    @client = MongoClient.new
    @db = @client['revue-db']
    @coll = @db['revue-collection-rspec']
  end

  def self.find(key, value)
    @key = key
    @value = value
    @coll.find(@key => @value).to_a
  end

  def self.dbinsert(revuehash)
    @revuehash = revuehash
    @coll.insert(@revuehash)
  end

  def self.dbclean
    @coll.drop_collection['revue-collection-rspec']
  end
end

describe "Test mongo db" do
  before(:each) do
    Revuelog.new("2014-11-28 13:58:33 +0100", "nickname", "Love TDD").to_hash
    MongodbSpec.dbnew.dbinsert(:revuehash)
  end

  after(:each) do
    MongodbSpec.dbclean
  end

  it { expect(MongodbSpec.find(nick, nickname)).to be true}
end

