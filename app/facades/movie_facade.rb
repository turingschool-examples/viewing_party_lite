# frozen_string_literal: true

require './app/poros/movie'
class MovieFacade
  attr_reader :movie

  def initialize(movie_id)
    @movie = Movie.new(MovieService.information(movie_id))
  end
end
