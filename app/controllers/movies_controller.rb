class MoviesController < ApplicationController
  def index
    if params[:q] == "top_rated"
      @movies = MoviesFacade.get_top_movies
    else params[:q] == "search"
      # @search = params[:search]
      @movies = MoviesFacade.get_search(params[:q])
      # require "pry"; binding.pry
    end
  end
end
