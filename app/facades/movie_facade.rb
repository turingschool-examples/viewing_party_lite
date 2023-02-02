class MovieFacade
  def self.top_rated_movies
    data = MovieService.top_rated_movies_response
    data[:results].map do |movie_information|
      IndexMovie.new(movie_information)
    end
  end

  def self.search_results(search_params)
    data = MovieService.search_results_response(search_params)
    data[:results].map do |movie_information|
      IndexMovie.new(movie_information)
    end
  end

  def self.find_movie(movie_id)
    data = MovieService.find_movie_response(movie_id)
    ShowMovie.new(data)
  end
end