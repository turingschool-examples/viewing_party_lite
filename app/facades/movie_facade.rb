class MovieFacade
  class << self 
    def get_a_movie(movie)
      data = MovieService.call_for_a_movie(movie)
      data[:results].map do |movie|
        Movie.new(movie)
      end
    end

    def find_top_movies
      data_1 = MovieService.call_top_movies(1)
      require 'pry'; binding.pry
    end
  end
end