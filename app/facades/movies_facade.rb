class MoviesFacade

  def self.top_rated
    top_movies = MoviesService.get_top_rated

    top_movies[0..39].map do |movie|
      Movie.new(movie)
    end
  end

  def self.search(keyword)
    search_results = MoviesService.find_movies(keyword)
binding.pry
    search_results.map do |movie|
      MovieSearch.new(movie)
    end
  end
end
