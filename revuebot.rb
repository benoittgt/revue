require 'cinch'
require './revuelog'

bot = Cinch::Bot.new do
  configure do |c|
    c.server = "irc.freenode.org"
    c.channels = ["#botwarss"]
  end
  on :message do |m|
  	revuelog(m)
end
	end

bot.start