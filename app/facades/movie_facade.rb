class MovieFacade

  def self.top_rated
    top_movies = []
    data = MovieService.get_top_rated_movies
    data.each do |movie|
      top_movies << Movie.new(movie)
    end
    top_movies
  end
end
