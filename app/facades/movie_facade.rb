class MovieFacade

  def self.get_movie(id)
    movie_info = MovieService.get_movie(id)  
    movie_detail = MovieDetail.new(movie_info)
  end
  
  def self.top_cast(id)
    cast = TopCastService.get_cast(id)[:cast][0..9]
    cast.map do |data|
      Actor.new(data)
    end
  end

  def self.top_rated
    TopRatedMovieService.movies[:results].map do |movie|
      MovieDetail.new(movie)
    end
  end

  def self.movie_search(query)
    MovieSearchService.search(query)[:results].map do |movie|
      MovieDetail.new(movie)
    end
  end
end