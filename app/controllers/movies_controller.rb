class MoviesController < ApplicationController
  def index
    if params[:top_rated] == "top_rated"
      @movies = MovieFacade.top_movies
    elsif params[:search] != nil
      @movies = MovieFacade.keywords(params[:search])
    end
  end
end
