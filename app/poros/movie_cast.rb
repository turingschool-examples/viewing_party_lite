class MovieCast
  attr_reader :name,
              :character

  def initialize(attributes)
    @name = attributes[:name]
    @character = attributes[:character]
  end
end