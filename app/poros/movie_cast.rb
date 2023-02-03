class MovieCast
  attr_reader :name, :character, :id
  
  def initialize(actor_data)
    @name = actor_data[:name]
    @character = actor_data[:character]
    @id = actor_data[:id]
  end
end