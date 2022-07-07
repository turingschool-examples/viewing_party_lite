class MoviesFacade

  def self.top_movies
    parsed_json = MovieService.top_movies

    parsed_json.each do |movie|
      Movie.new(movie)
    end
  end
end
