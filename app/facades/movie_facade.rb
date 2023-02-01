class MovieFacade
  attr_reader :movie_service

  def initialize
  end

  def get_movie(id)
    movie_info = MovieService.get_movie(id)  
    movie_detail = MovieDetail.new(movie_info)
  end
end
