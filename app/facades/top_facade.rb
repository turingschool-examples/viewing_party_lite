require './app/poros/movie'

class TopFacade

  def self.top_rated
    @top_rated = []
    MovieService.top_rated[:results].each do |data|
      top_movie = MovieService.movie(data[:id])
      @top_rated << Movie.new(top_movie)
    end
      @top_rated
  end
end
