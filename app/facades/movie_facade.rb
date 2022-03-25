class MovieFacade
  class << self
    def top_rated_movies
      response = MovieService.top_rated_movies

      response[:results].map do |data|
        Movie.new(data)
      end
    end

    def cast_members(movie_id)
      response = MovieService.cast_members(movie_id)

      response[:cast].map do |data|
        CastMember.new(data)
      end
    end

    def movie_details(movie_id)
      data = MovieService.movie_details(movie_id)

      MovieDetails.new(data)
    end

    def reviews(movie_id)
      data = MovieService.reviews(movie_id)

      data[:results].map do |result|
        Reviews.new(result)
      end
    end

    def search_movies(keyword)
      movies_data = MovieService.search_movies(keyword)

      movies_data.map do |movie|
        Movie.new(movie)
      end
    end
  end
end
