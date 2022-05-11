class Movie
  attr_reader :title, :vote_average, :id
  def initialize(movie_data)
    @title = movie_data[:title]
    @vote_average = movie_data[:vote_average]
    @id = movie_data[:id]
  end
end
