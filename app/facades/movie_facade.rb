class MovieFacade

  def self.get_movie
    require pry; binding.pry
    movies = MovieService.get_top_movies[:results]
    movies.map do |movie|
      Movie.new(movie)
    end
  end
end