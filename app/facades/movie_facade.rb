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

    def find_movie_details(movie_id)
      data = MovieService.call_movie_details(movie_id)
      cast = MovieService.call_movie_cast(movie_id)
      reviews = MovieService.call_movie_reviews(movie_id)
        MovieDetails.new(data, cast, reviews)
    end

  end
end
