class MovieFacade 

  def self.top_rated_movies
     MovieService.top_rated_movies.map { |data| Movie.new(data) }
  end 
  
  def self.search_movie(keyword)
    MovieService.search_movie(keyword).map { |data| Movie.new(data) }
  end
end 