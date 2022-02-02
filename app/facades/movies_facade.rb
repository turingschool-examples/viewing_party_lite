require './app/poros/movie.rb'
class MoviesFacade
  class << self
    def get_top_movies
      @movies = MovieService.top_rated_movies
      # @movies.map do |movie|
      #   Movie.new(movie)
      # end
    end

    def get_search(keyword)
      @movies = MovieService.movie_search(keyword)
    end
  end
end
