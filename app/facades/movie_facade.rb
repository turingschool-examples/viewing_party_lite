class MovieFacade

  def top_40_movies
    service.top_movies.map do |movie_info|
      Movie.new(movie_info)
    end
  end

  def movie_search(search_param)
    # require 'pry'; binding.pry
    service.search_movies(search_param).map do |movie_info|
    Movie.new(movie_info)
    end
  end

  def find_movie(id)
    service.find_movie(id).map do |info|
      MovieDetails.new(info)
    end
  end

  def service
    MovieService.new
  end
end
