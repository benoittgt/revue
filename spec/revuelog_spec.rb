require './spec/spec_helper'
require 'rspec'
require 'rack/test'

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
end

describe "create object from irc message" do
  let(:revueobj) { Revuelog.new("2014-11-28 13:58:33 +0100", "nickname", "Love TDD") }
  describe "checking revue object initialize" do
    it { expect(revueobj.nick).to eq("nickname") }
    it { expect(revueobj.time).to eq("2014-11-28 13:58:33 +0100") }
    it { expect(revueobj.message).to eq("Love TDD") }
  end

  describe "checking hash object" do
    it { expect(revueobj.to_hash).to be_kind_of(Hash)}
    it { expect(revueobj.to_hash["time"]).to eq("2014-11-28 13:58:33 +0100")}
    it { expect(revueobj.to_hash["nick"]).to eq("nickname")}
    it { expect(revueobj.to_hash["message"]).to eq("Love TDD")}
  end

end

describe "Test Mongodb" do
  let(:revuedb) {Revuedb.new}
  before(:each) do
    revuehash = Revuelog.new("2012-11-28 13:58:33 +0100", "Paul", "Love TDD and Paul").to_hash
    revuedb.dbinsert(revuehash)
    revuehash2 = Revuelog.new("2014-11-28 16:58:33 +0100", "Semia", "Love TDD !!").to_hash
    revuedb.dbinsert(revuehash2)
  end

  after(:each) do
    revuedb.dbclean
  end

  it { expect(revuedb.find("nick", "Paul").first['nick']).to eq('Paul')}
  it { expect(revuedb.distinct("nick")).to eq(['Paul','Semia'])}
end

describe "Sinatra render json" do

  def app
    Sinatra::Application
  end

  let(:revuedb) {Revuedb.new}
  before(:each) do
    revuehash = Revuelog.new("2012-11-28 13:58:33 +0100", "Paul", "Love TDD and Paul").to_hash
    revuedb.dbinsert(revuehash)
  end

  #after(:each) do
  #  revuedb.dbclean
  #end

  it "answer json to root path" do
    get '/'
    expect(last_response).to be_ok
  end

  it "answer json to document path" do
    get '/documents/?'
    expect(last_response).to_not include("_id") 
  end
end
