# frozen_string_literal: true

class MovieFacade
  def self.top_movies
    top_movies = MovieService.get_top_movies
    top_movies.map do |data|
      TopMovie.new(data)
    end
  end

  def self.movie(id)
    movie = MovieService.get_movie(id)
    Movie.new(movie)
  end

  def self.search_movies(search_term)
    movies = MovieService.search_movies(search_term)
    movies.map do |data|
      TopMovie.new(data)
    end
  end
end
