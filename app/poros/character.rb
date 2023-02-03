class Character
  attr_reader :actor, :character

  def initialize(data)
    @actor = data[:name]
    @character = data[:character]
  end
end
