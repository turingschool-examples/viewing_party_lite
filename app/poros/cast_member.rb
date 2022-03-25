class CastMember
  attr_reader :name,

  def initialize(data)
    @name = data[:name]
    @character = data[:character]
  end
end
