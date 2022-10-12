class MovieFacade
  def self.create_top_20_movies
    movies = MovieService.get_top_rated
    movies.map do |movie|
      Movie.new(movie)
    end
  end
end