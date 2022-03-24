require './app/poros/movie'

class TopFacade
  attr_reader :top_rated
  def initialize
    @top_rated = []
    MovieService.top_rated[:results].each do |data|
      top_movie = MovieService.movie(data[:id])
      @top_rated << Movie.new(top_movie)

    end
  end
end
