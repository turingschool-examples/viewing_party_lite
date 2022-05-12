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
    production = service.movie_details(movie_id)
    cast = service.cast(movie_id)
    reviews = service.reviews(movie_id)
    Movie.new(production, cast, reviews)
#    cast = service.cast(movie_id)
#    reviews = service.reviews(movie_id)
  end
end
