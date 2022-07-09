class MovieFacade

  def return_top_40_movies
    parsed_json = MovieService.new.top_40_rated_movies

    parsed_json.map do | movie_json |
      Movie.new(movie_json)
    end
  end

  def search_movie(query)
    parsed_json = MovieService.new.movie_search(query)
    parsed_json[:results].map do |movie_json|
      Movie.new(movie_json)
    end
  end

  def movie_search(id)
    parsed_json = MovieService.new.poro_search(id)

    # parsed_json[:results].map do |movie_json|
    Movie.new(parsed_json)

  end

  def movie_details(id)
    parsed_json = MovieService.new.details_of_movie(id)
      MovieDetails.new(parsed_json)
  end
end
