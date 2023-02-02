class TopRatedMoviesFacade
  def self.top_20_rated_movies
    data = TMDBService.get_top_rated_movies
    results = data[:results]
    top_20 = results[0..19].map do |result|
        MovieResults.new(result)
      end
  end
end