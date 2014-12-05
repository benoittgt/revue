require './spec/spec_helper'

describe "create object from irc message" do
  let(:revueobj) { Revuelog.new("2014-11-28 13:58:33 +0100", "nickname", "Love TDD") }
  describe "checking revue object initialize" do
    it { expect(revueobj.nick).to eq("nickname") }
    it { expect(revueobj.time).to eq("2014-11-28 13:58:33 +0100") }
    it { expect(revueobj.message).to eq("Love TDD") }
  end

  describe "checking hash object" do
    it { expect(revueobj.to_hash).to eq("time" => "2014-11-28 13:58:33 +0100", "nick" => "nickname", "message" => "Love TDD") }
  end

  describe "insert data into database" do
    skip { expect(Revuelog.dbadd(@nickname)).to eq("nickname") }
  end
end
