class MovieActor
  attr_reader :name, :popularity, :character

  def initialize(actor_information)
    @name = actor_information[:name]
    @popularity = actor_information[:popularity]
    @character = actor_information[:character]
  end
end