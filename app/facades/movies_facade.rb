class MoviesFacade

  def self.top_movies
    movies = []
    parsed_json = MovieService.top_rated
    parsed_json[:results].each do |movie|
      movies << Movie.new(movie)
    end
    return movies
  end
end
