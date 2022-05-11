class CastMember
  attr_reader :character, :actor

  def initialize(attributes)
    @character = attributes[:character]
    @actor = attributes[:name]
  end
end
