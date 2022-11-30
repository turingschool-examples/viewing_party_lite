class MovieFacade
  def self.posters(movie)
    json = MovieService.posters_en_us(movie)
    Poster.new(json)
  end
end