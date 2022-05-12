class MovieFacade
  def self.service
    MovieService.new
  end

  def self.top_rated
    service.top_movies.map { |details| Movie.new(details) }
  end

  def self.find_movies(search)
    service.movies_by_query(search).map { |details| Movie.new(details) }
  end

  def self.movie_info(movie_id)
    production = MovieService.movie_details(movie_id)
    cast = MovieService.cast(movie_id)
    reviews = MovieService.reviews(movie_id)
  end
end
