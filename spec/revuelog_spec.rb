require './spec/spec_helper'

RSpec.describe "create object from irc message" do
  before(:example) do
    @revueobj = Revuelog.new("2014-11-28 13:58:33 +0100", "nickname", "Love TDD")
  end

  describe "checking revue object initialize" do
    it "contain nickname" do
      expect(@revueobj.nick).to eq("nickname")
    end

    it "contain timestamp" do
      expect(@revueobj.time).to eq("2014-11-28 13:58:33 +0100")
    end

    it "contain message" do
      expect(@revueobj.message).to eq("Love TDD")
    end
  end
end

