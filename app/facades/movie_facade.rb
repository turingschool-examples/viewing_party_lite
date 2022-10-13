class MovieFacade
  
  def self.movie_details(search_id)
    data = MovieService.movie_by_id(search_id)
    Movie.new(data)
  end

  def self.top_20_movies
    data = MovieService.top_rated_movies
    data[:results].map do |movie_info|
      Movie.new(movie_info)
    end
  end

  def self.search_results(movie_term)
    data = MovieService.movie_search(movie_term)
    data[:results].map do |movie_info|
      Movie.new(movie_info)
    end
  end
end
