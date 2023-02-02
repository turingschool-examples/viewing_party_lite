class MoviesFacade
  def self.search_results(query)
    data = MoviesService.movie_search
    results = data[:results].find_all do |movie|
      movie[:title].downcase.include?(query.downcase)
    end
    results.map do |movie_result_data|
      MovieResult.new(movie_result_data)
    end
  end

  def self.top_movies 
    data = MoviesService.top_rated
    results = data[:results]
    results.map do |movie_result_data|
      MovieResult.new(movie_result_data)
    end
  end
end
