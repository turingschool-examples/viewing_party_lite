class MovieFacade 
  def self.movie_data(movie_id)
    get_repo_data = MovieService.get_movie_data(movie_id)
    MovieInfo.new(get_repo_data)
  end
end
