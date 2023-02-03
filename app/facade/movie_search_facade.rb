class MovieSearchFacade
  def self.movie_search(keyword)
    data = TMDBService.get_movie_search_query(keyword)
    results = data[:results]
    results[0..19].map do |movie|
      MovieResults.new(movie)
    end
  end
end
