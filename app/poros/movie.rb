class Movie
  attr_reader: :id, :movie_title, :movie_duration, :vote_average, :poster_path
  def initialize(result)
    @id = result[:id]
    @movie_title = result[:title]
    @movie_duration = result[:runtime]
    @vote_average = result[:vote_average]
    @poster_path = result[:poster_path]
  end
end
