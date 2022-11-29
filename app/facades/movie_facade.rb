class MovieFacade
  def self.posters(movies)
    jsons = MovieService.posters_en_us(movies)

    @file_paths = jsons.map do |json|
      Poster.new(json)
    end
  end
end