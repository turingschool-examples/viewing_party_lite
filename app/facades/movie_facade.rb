class MovieFacade
  def self.top_rated
    # top_movies_array = MovieService.top_rated_movies
    # @top_movies = top_movies_array.map do |movie_data|
    #   data = {}
    #   data[:movie_id] = movie_data[:id]
    #   data[:title] = movie_data[:title]
    #   data[:rating] = movie_data[:vote_average]
    #   Movie.new(data)
    # end
    # @top_movies

    @top_movies = MovieService.top_rated_movies.map do |info|
      TopMovie.new(info)
    end
  end

  def self.service
    MovieService.new
  end
end