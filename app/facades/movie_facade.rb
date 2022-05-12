class MovieFacade
  def self.top_rated_movies
    MovieService.top_rated_movies[:results].map do |movie|
      Movie.new(movie)
    end
  end
end
