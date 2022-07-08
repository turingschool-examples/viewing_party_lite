# frozen_string_literal: true

class MovieFacade
  def self.top_20_movies
    movie_data = MovieService.top_20_movies

    movie_data.map do |movie_json|
      Movie.new(movie_json)
    end
  end

  def self.movie_by_keyword(keyword)
    movie_data = MovieService.movie_by_keyword(keyword)

    movie_data.map do |movie_json|
      Movie.new(movie_json)
    end
  end
end
