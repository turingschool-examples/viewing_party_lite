class MoviesController < ApplicationController

  def discover
    @user = User.find(params[:user_id])
  end

  def index
    @user = User.find(params[:user_id])
    if params[:search] == "top rated"
      @movies = MoviesFacade.get_top_20_movies
    else
      @movies = MoviesFacade.get_search_results_movies(params[:search])
    end
  end

  def show
    @user = User.find(params[:user_id])
    @movie = MoviesFacade.get_movie(params[:id])
  end
  
end