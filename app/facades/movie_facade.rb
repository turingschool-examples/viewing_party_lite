class MovieFacade 
  @viewing_parties = ViewingParty.all
  
  def self.movies(movie_ids)
   movie_ids.map {|id| helper(id)}
  end

  def self.helper(movie_id)
    Movie.new(MovieService.details(movie_id))
  end
end