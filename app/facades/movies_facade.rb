class MoviesFacade
  def self.get_movies(top_rated)
    MoviesService.get_top_rated_movies(top_rated)
  end
end
