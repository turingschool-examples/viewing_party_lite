class MovieFacade 

  def self.movies(movie_ids)
    movie_ids.map {|id| helper(id)}
  end

  def self.helper(movie_id)
    Movie.new(MovieService.details(movie_id))
  end

  def self.top_rated 
    Movie.new(MovieService.details)
  end
end