require 'cinch'
#require './revuelog'
require 'pry'
require_relative "lib/cinch/plugins/revuelog"

bot = Cinch::Bot.new do
  configure do |c|
    c.server = 'irc.freenode.org'
    c.channels = ['#go-nuts']
    c.nick = 'revue_nick'
    c.plugins.plugins = [
      Cinch::Plugins::Revue
    ]
  end

end

bot.start
