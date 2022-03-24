class MovieFacade
  def self.top_movie
    results = MovieService.get_top_movie
    results.map do |result|
      Movie.new(result)
    end
  end
end
