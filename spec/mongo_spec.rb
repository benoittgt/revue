require './spec/spec_helper'
require 'mongo'

include Mongo

class MongodbSpec

  def self.dbnew
    db = MongoClient.new("localhost", 27017).db("revue_db")
    @coll = db["revue-collection-rspec"]
    self
  end

  def self.find(key, value)
    @coll.find({key => value}, :fields => [key]).to_a
  end

  def self.distinct(key)
    @coll.distinct(key).to_a
  end

  def self.dbinsert(revuehash)
    @coll.insert(revuehash)
  end

  def self.dbclean
    @coll.drop
  end
end

describe "Test mongo db" do
  before(:each) do
    revuehash = Revuelog.new("2012-11-28 13:58:33 +0100", "Paul", "Love TDD and Paul").to_hash
    MongodbSpec.dbnew.dbinsert(revuehash)
    revuehash2 = Revuelog.new("2014-11-28 16:58:33 +0100", "Semia", "Love TDD !!").to_hash
    MongodbSpec.dbnew.dbinsert(revuehash2)
  end

  after(:each) do
    MongodbSpec.dbnew.dbclean
  end

  it { expect(MongodbSpec.find("nick", "Paul").first['nick']).to eq('Paul')}
  it { expect(MongodbSpec.distinct("nick")).to eq(['Paul','Semia'])}
end

