class Movie
  attr_reader :title, :vote_average, :id

  def initialize(movie_data)
    @id = movie_data[:id] if movie_data[:id]
    @title = movie_data[:title] if movie_data[:title]
    @vote_average = movie_data[:vote_average] if movie_data[:vote_average]
    @runtime = movie_data[:runtime] if movie_data[:runtime]
    @genres = movie_data[:genres] if movie_data[:genres]
    @summary = movie_data[:summary] if movie_data[:summary]
    @top_cast_members = movie_data[:cast] if movie_data[:cast]
    @reviews = movie_data[:reviews] if movie_data[:reviews]
  end
end