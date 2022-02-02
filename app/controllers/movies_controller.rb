class MoviesController < ApplicationController
  def index
    @movies = MoviesFacade.get_top_movies
    require "pry"; binding.pry
  end
end
