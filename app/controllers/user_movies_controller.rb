class UserMoviesController < ApplicationController
  def index
    if params[:q] == "top 20rated"
      @movies = MovieFacade.top_40
    else
      @search_movies = MovieFacade.search_by_keyword(params[:q])
    end
  end

  def show
    @movie = MovieFacade.find_movie(params[:id])
    @cast = MovieFacade.find_cast(params[:id])
  end
end
