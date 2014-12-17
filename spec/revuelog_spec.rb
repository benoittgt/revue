require './spec/spec_helper'

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
  let(:db) { Revuedb.new }

  before(:each) do
    revuehash = Revuelog.new("2012-11-28 13:58:33 +0100", "Paul", "Love TDD and Paul").to_hash
    db.dbinsert(revuehash)
    revuehash2 = Revuelog.new("2014-11-28 16:58:33 +0100", "Semia", "Love TDD !!").to_hash
    db.dbinsert(revuehash2)
  end

  after(:each) do
    db.dbclean
  end

  it { expect(db.find("nick", "Paul").first['nick']).to eq('Paul')}
  it { expect(db.distinct("nick")).to eq(['Paul','Semia'])}
end

