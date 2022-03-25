class CastMember
  attr_reader :name,
              :character,
              :id

  def initialize(data)
    @name = data[:name]
    @character = data[:character]
    @id = data[:id]
  end
end
