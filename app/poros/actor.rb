class Actor
  attr_reader :name,
              :character

  def initialize(actor_data)
    @name      = actor_data[:name]
    @character = actor_data[:character]
  end
end
