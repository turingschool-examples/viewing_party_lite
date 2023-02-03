class Movie
  attr_reader :movie_id, :title, :vote_average, :runtime, :genres, :overview

  def initialize(attributes)
    @movie_id = attributes[:id]
    @title = attributes[:title]
    @vote_average = attributes[:vote_average]
    @runtime = attributes[:runtime]
    @genres = attributes[:genres]
    @overview = attributes[:overview]
  end
end