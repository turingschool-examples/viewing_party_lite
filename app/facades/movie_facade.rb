class MovieFacade 

  def self.top_movies
     MovieService.popular_movies.map { |info| Movie.new(info) }
  end 
  
  # def self.movie_info(movie_id)
  # end
  
  # def self.movie_search(search)
  # end
end 