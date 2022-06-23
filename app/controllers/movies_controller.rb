class MoviesController < ApplicationController

  def index; end

  def results
    if params[:q] == "top rated"
      @movies = MovieFacade.top_rated
    elsif params[:search]
      @movies = MovieFacade.search_by_title(params[:search])
    end
  end

  def show
    @movie = MovieFacade.find_movie(params[:id])
  end
end
