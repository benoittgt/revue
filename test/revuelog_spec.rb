require './test/spec_helper'

RSpec.describe "create object from irc message" do
    it "create object" do
    end
end




class RevuelogTest < Minitest::Unit::TestCase
  NICKNAME = "nickname"
  TIME     = "2014-11-28 13:58:33 +0100"
  MESSAGE  = "Love TDD"

  def setup
    @revuelog = Revuelog.new("2014-11-28 13:58:33 +0100", "nickname", "Love TDD")
  end

  def test_revuelog_nickame
    assert_equal NICKNAME, @revuelog.nick
  end

  def test_revuelog_time
    assert_equal TIME, @revuelog.time
  end

  def test_revuelog_message
    assert_equal MESSAGE, @revuelog.message
  end
end
