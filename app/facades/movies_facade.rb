class MoviesFacade
  def self.get_movies(top_rated)
    json = MoviesService.get_top_rated_movies(top_rated)

    json[:results].map do |movie|
      Movie.new(movie)
    end
  end
end
