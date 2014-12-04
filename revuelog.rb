class Revuelog
  attr_reader :time, :nick, :message

  def initialize(time, nick, message)
    @time    = time
    @nick    = nick
    @message = message
  end

  def self.dbadd(revueobj)
   self
  end

  private

  def revuedb
    client = MongoClient.new
    db     = client['revue-db']
    coll   = db['revue-collection']
  end
end

