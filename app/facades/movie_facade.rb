class MovieFacade
  def self.top_rated_movies_list
    MovieService.top_rated_movies[:results].map do |movie|
      Movie.new(movie)
    end
  end
end
