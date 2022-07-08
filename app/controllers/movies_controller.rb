class MoviesController < ApplicationController
  def index
    if params[:q] == "top rated"
      @all_movies = MovieFacade.top_rated
    end
  end
end
