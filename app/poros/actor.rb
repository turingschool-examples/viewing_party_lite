class Actor
  attr_reader :name,
              :character
              
  def initialize(response)
    @name = response[:name]
    @character = response[:character]
  end
end