class MovieFacade
  def self.top_rated
    top_movies = MovieService.get_top_rated
  end
end
