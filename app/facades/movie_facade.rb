class MovieFacade

  def self.movie_details(movie_id)
   data = MovieService.get_movie_data(movie_id)
   Movie.new(data)
  end
end