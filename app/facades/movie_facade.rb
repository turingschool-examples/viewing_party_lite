class MovieFacade

  # def self.top_rated
  #   top_movies = []
  #   data = MovieService.get_top_rated_movies
  #   data.each do |movie|
  #     top_movies << Movie.new(movie)
  #   end
  #   top_movies
  # end

  def self.all_movies(query)
    data = MovieService.movie_query_results(query)
    data[:results].map do |movie_result|
      Movie.new(movie_result)
    end
  end
end
