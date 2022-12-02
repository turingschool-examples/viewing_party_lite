class MovieFacade
  
  def self.top_rated
    data = MovieService.top_rated_movies
    limit_20 = data[0..20]
    limit_20.map {|movie| Movie.new(movie)}
  end
end