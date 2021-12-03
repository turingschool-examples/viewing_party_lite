class MovieFacade

  def self.find_popular_movies
    movies = MovieService.popular_movies

    results = movies[:results]
    results.map do |movie_data|
      Movie.new(movie_data)
    end
  end

  def self.get_movie_details(movie_id)
    movie_data = MovieService.get_movie_details_db(movie_id)

    Movie.new(movie_data)
  end

end
