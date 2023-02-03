class MovieFacade
  #add user?
  def initialize(query = '')
    @movie_service = MovieService.new(query)  
  end

  def get_top_movies
    response = @movie_service.get_top_movies
    build_movies(response)     
  end

  def search_movies(query)
    response = @movie_service.search_movies(query)
    build_movies(response)
  end

  def movie
    response = @movie_service.movie
    @movie ||= Movie.new(response)
  end

  private 

  def build_movies(response)
    response[:results].map do |movie|
      Movie.new(movie)
    end
  end
end

