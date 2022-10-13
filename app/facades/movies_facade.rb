class MoviesFacade
  def self.top_rated_movies
    json = MoviesService.top_rated

    @movies = json[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end
end