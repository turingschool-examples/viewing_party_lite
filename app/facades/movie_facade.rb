class MovieFacade

  def self.movie_list(query)
    json = MovieService.movie_results(query)
    json[:results].map do |result|
      Movie.new(result)
    end
  end
end
