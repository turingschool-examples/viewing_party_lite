class TopRatedMoviesFacade
  def self.top_20_rated_movies(data)
    results = data[:results]
      top_20 = results[0..19].map do |result|
        TopRatedMovies.new(result)
      end
  end
end