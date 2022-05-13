class MoviesController < ApplicationController
  def index
    @user = User.find(params[:id])
  end
  
  def results
    facade = MovieFacade.new
    
    if params[:q] == "top rated"
      @movies = facade.top_rated
    elsif params[:movie_title]
      @movies = facade.search(params[:movie_title])
    end
    @user = User.find(params[:id])
    #memoize facade
  end
  
  def details
    facade = MovieFacade.new

    @movie = facade.search_by_id(params[:id])
  end
end