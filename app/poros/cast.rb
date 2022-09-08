class Cast
  attr_reader :cast

  def initialize(data)
    @cast = data[:cast].map { |actor| actor[:name] }
  end 


end