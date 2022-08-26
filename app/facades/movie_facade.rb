# frozen_string_literal: true

class MovieFacade
  def self.movie_search(search)
    MovieService.movie_search(search).map do |movie_data|
      Movie.new(movie_data)
    end
  end

  def self.top_rated
    MovieService.top_rated.map do |movie_data|
      Movie.new(movie_data)
    end
  end

  def self.movie_details(movie_id)
    json = MovieService.movie_details(movie_id)
    MovieDetails.new(json)
  end
end