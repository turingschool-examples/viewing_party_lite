class MovieDBFacade
  def self.top_movies
    parsed = MovieDBService.top_rated_movies
    @top_rated_movies = parsed[:results].map do |movie_data|
      TopMovie.new(movie_data)
    end
  end
end
