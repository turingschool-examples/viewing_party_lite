class MovieFacade

  def self.movie_results(query)
    json = MovieService.movie_query_results(query)
    json[:results].map do |movie_result|
      Movie.new(movie_result)
    end
  end
end
