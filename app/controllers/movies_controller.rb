class MoviesController < ApplicationController
  def index
    if params[:q] == "top_rated"
      @movies = MoviesFacade.get_top_movies
    else params[:q] == "search"
      @movies = MoviesFacade.get_search(params[:q])
    end
  end
end
