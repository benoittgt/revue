class Revuelog
  attr_reader :time, :nick, :message

  def initialize(time, nick, message)
    @time    = time
    @nick    = nick
    @message = message
    #@revueobjt = Struct.new(:time, :nick, :message)
  end

  def to_hash
    puts self
    hash = {}
    @revuobjt.instance_variables.each {|var| hash[var.to_s.delete("@")] = @revuobjt.instance_variable_get(var) }
    p hash
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
