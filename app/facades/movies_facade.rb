class MoviesFacade
  def self.top_rated
    json = MoviesService.top_rated_movies

    @movies = json[:results].map do |movie_data|
      Movie.new(movie_data)
    end
  end
end