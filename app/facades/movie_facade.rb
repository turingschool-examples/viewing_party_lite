class MovieFacade
  #add user?
  def initialize(query = '')
    @movie_service = MovieService.new(query)  
  end

  def get_top_movies
    @movie_service.get_top_movies
  end

  def search_movies(query)
    @movie_service.search_movies(query)
  end

  def movie
    @movie ||= Movie.new(@movie_service.movie)
  end
end

