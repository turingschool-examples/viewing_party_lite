class MovieFacade
  def self.top_rated_movies
    MovieService.top_rated_movies[:results].map do |movie|
      Movie.new(movie)
    end
  end

  def self.search_movies(movie_title)
    MovieService.search_movies(movie_title)[:results].map do |movie|
      Movie.new(movie)
    end
  end
end
