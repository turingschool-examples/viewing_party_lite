class MovieFacade

  def self.return_top_40_movies
    parsed_json = MovieService.top_40_rated_movies

    parsed_json.map do | movie_json |
      Movie.new(movie_json)
    end
  end
end