class MovieFacade
  #add user?
  def initialize(opts = {url: ''})
    @movie_service = MovieService.new(opts[:url])  
  end

  def movie
    @movie ||= Movie.new(JSON.parse(@movie_service.movie, symbolize_names: true))
  end
end
