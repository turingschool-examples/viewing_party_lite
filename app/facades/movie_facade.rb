class MovieFacade

  def self.find_popular_movies
    movies = MovieService.popular_movies

    results = movies[:results]
    results.map do |movie_data|
      Movie.new(movie_data)
    end
  end

end
