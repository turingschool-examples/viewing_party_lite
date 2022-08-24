class MovieFacade
  class << self 
    def get_a_movie(movie)
      data_1 = MovieService.call_for_a_movie(movie, 1)[:results]
      data_2 = MovieService.call_for_a_movie(movie, 2)[:results]
      data = data_1 + data_2
      data.map do |movie|
        Movie.new(movie)
      end
    end

    def find_top_40_movies
      data_1 = MovieService.call_top_movies(1)[:results]
      data_2 = MovieService.call_top_movies(2)[:results]
      data = data_1 + data_2
      data.map do |movie|
        Movie.new(movie)
      end
    end

  end
end