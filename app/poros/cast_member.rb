class CastMember
  attr_reader :name, :character

  def initialize(result)
    @name = result[:name]
    @character = result[:character]
  end
end
