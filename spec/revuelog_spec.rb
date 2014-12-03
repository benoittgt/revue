require './spec/spec_helper'

describe "create object from irc message" do

  describe "checking revue object initialize" do
    let(:revueobj) { Revuelog.new("2014-11-28 13:58:33 +0100", "nickname", "Love TDD") }

    it { expect(revueobj.nick).to eq("nickname") }
    it { expect(revueobj.time).to eq("2014-11-28 13:58:33 +0100") }
    it { expect(revueobj.message).to eq("Love TDD") }
  end

  describe "insert data into database" do
    let(:revueobj) { Revuelog.new("2014-11-28 13:58:33 +0100", "nickname", "Love TDD") }

    it { expect(revueobj.nick).to eq("nickname") }
    it { expect(revueobj.time).to eq("2014-11-28 13:58:33 +0100") }
    it { expect(revueobj.message).to eq("Love TDD") }
  end
e
end

