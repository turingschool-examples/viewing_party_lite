class Movie

  attr_reader :original_title, :vote_average, :id

  def initialize(movie_data)
    @original_title = movie_data[:original_title]
    @vote_average = movie_data[:vote_average]
    @id = movie_data[:id]
  end

end
