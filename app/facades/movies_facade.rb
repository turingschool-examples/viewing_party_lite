class MoviesFacade

  def self.find_top_rated
    json = MoviesService.top_rated_movies
    top_rated_movies = TopMovies.new(json)
  end

  def self.find_movie_details

  end

  def self.find_movie_credits

  end

  def self.find_movie_reviews

  end

end
