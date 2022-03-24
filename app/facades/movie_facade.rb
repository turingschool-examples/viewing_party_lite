class MovieFacade
  def self.movie_show(movie_id)
    production = MovieService.movie_deets(movie_id)
    cast = MovieService.cast(movie_id)
    reviews= MovieService.reviews(movie_id)
    movie = MovieData.new(production, cast, reviews)
  
  end
end
