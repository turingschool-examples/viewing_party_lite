class MovieFacade   
  def self.movies(movie_ids)
   movie_ids.map {|id| movie_info(id)}
  end

  def self.movie_info(movie_id)
    Movie.new(MovieService.details(movie_id), MovieService.reviews(movie_id), MovieService.credits(movie_id))
  end
end