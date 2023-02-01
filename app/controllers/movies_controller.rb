class MoviesController < ApplicationController
  def index
    # binding.pry
    load_movies = TMDBService.new
    @top_rated = load_movies.get_top_rated_movies
    binding.pry
  end
end