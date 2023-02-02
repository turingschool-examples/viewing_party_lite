class MovieSearchFacade
  def self.movie_search(data)
    results = data[:results]
    results[0..19].map do |movie|
      MovieResults.new(movie)
    end
  end
end