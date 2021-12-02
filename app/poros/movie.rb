class Movie

  attr_reader :original_title, :vote_average

  def initialize(movie_data)
    @original_title = movie_data[:original_title]
    @vote_average = movie_data[:vote_average]
  end

end
