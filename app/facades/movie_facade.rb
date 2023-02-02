class MovieFacade

  def get_movie(id)
    movie_info = MovieService.get_movie(id)  
    movie_detail = MovieDetail.new(movie_info)
  end

  def self.top_rated
    TopRatedMovieService.movies["results"]
  end

  def self.movie_search(query)
    MovieSearchService.search(query)["results"]
  end
end
