class Cast
  attr_reader :cast

  def initialize(data)
    @cast = data[:cast][0..9].map { |actor| actor[:name]}
  end 


end