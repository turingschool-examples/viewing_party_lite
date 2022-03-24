class MovieFacade
    def best_movies
      MovieService.top_rated.map do |data|
        Movie.new(data)
      end.take(20)
    end

    def search(movie)
      MovieService.search_for_movie(movie).map do |data|
        Movie.new(data)
      end.take(40)
    end

    def details(movie_id)
      MovieDetail.new(MovieService.movie_details(movie_id))
    end 
end
