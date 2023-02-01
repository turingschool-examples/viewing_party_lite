class MovieFacade
  def self.get_movie(id)
    movie_info = MovieService.get_movie(id)  
    movie_detail = MovieDetail.new(movie_info)
  end
end
