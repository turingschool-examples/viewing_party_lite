class MovieActor
  attr_reader :name, :popularity

  def initialize(actor_information)
    @name = actor_information[:name]
    @popularity = actor_information[:popularity]
  end
end