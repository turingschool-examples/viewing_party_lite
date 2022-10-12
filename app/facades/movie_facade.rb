class MovieFacade < MovieService
  
  def self.movies_top_rated
    MoviesTopRated.new(top_rated)
  end
end