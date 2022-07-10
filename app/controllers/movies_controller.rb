class MoviesController < ApplicationController
  def index
    if params[:q] == "toprated"
      @movies = MoviesFacade.top_movies
    elsif params[:q] != nil
      @movies = MoviesFacade.search(params[:q])
    end
  end
end
