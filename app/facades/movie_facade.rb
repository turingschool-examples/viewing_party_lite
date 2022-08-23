class MovieFacade
  class << self 
    def get_a_movie(movie)
      data = MovieService.call_for_a_movie(movie)
      movie = Movie.new(data)
      require 'pry'; binding.pry 
    end
  end
end