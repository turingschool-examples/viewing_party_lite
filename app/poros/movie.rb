class Movie
  attr_reader :id,
              :title,
              :vote_avg,
              :runtime,
              :summary

  def initialize(movie_data)
    @id         = movie_data[:id]
    @title      = movie_data[:title]
    @vote_avg   = movie_data[:vote_average]
    @runtime    = movie_data[:runtime]
    @genre_data = movie_data[:genres]
    @summary    = movie_data[:overview]
  end

  def genres
    @genre_data.map { |genre| genre[:name] }
  end
  # Runtime method? To stick with MVC (see calculations in view/movies/show)
end
