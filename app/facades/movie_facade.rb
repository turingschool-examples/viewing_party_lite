# frozen_string_literal: true

class MovieFacade
  def self.create_top_20_movies
    movies = MovieService.get_top_rated
    movies.map do |movie_data|
      Movie.new(movie_data)
    end
  end

  # TODO: write tests for service, poro, facade for movie_search_by_id
  def self.movie_search_by_id(search_params)
    movie = MovieService.get_movie_by_id(search_params)
    Movie.new(movie)
  end

  def self.movie_search(search_param)
    movies = MovieService.get_movie_search(search_param)
    movies.map do |movie_data|
      Movie.new(movie_data)
    end
  end
end
