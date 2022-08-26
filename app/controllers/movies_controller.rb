class MoviesController < ApplicationController
  def discover
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
    @movie = MovieFacade.movie_info(params[:movie_id])
  end

  def results
    if params[:q] == 'top rated' 
      @movies = MovieFacade.get_top_rated
      @user = User.find(params[:id])
    else
      @movies = MovieFacade.search(params[:q])
      @user = User.find(params[:id])
    end
  end
end