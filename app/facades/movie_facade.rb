class MovieFacade

  def self.top_rated_movies
    movies = MovieService.top_rated

    results = movies[:results]
    results.map do |movie_data|
      Movie.new(movie_data)
    end

  end
end
