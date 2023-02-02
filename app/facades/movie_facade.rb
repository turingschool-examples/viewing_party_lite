class MovieFacade
  #I want this to give me a movie from an api call
  def initialize(opts = {url: ''})
    @movie_service = MovieService.new(opts[:url])  
  end

  def movie
    @movie_service.movie
  end
end
