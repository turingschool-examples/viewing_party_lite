class Cast
  attr_reader :name, :character
  
  def initialize(credit_data)
    @name = credit_data[:name]
    @character = credit_data[:character]
  end
end