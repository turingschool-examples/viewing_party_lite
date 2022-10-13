class MovieFacade

  def self.movie_details(movie_id)
   data = MovieService.get_movie_details(movie_id)
   Movie.new(data)
  end
end