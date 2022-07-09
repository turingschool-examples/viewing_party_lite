class MoviesFacade
  def self.movie_id_search(id)
   json = MovieService.all_movie_id_search(id)
   Movie.new(json)
 end
end
