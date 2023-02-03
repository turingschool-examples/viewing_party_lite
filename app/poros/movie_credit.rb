class MovieCredit 
  attr_reader :cast

  def initialize(movie_credit_data)
    @cast = movie_credit_data[:cast]
  end

  def find_actor_name_and_character
    top_10_credits.map do |actor|
      "#{actor[:name]} as #{actor[:character]}"
    end.join(', ')
  end

  def top_10_credits 
    @cast[0..9]
  end
end