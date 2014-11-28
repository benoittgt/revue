require 'cinch'
require './revuelog'

bot = Cinch::Bot.new do
  configure do |c|
    c.server = "irc.freenode.org"
    c.channels = ["#botwarss"]
  end

  on :message do |m|
    Revuelog.new(m.time, m.nick, m.message)
  end
end

bot.start
