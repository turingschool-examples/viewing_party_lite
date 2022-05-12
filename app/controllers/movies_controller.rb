class MoviesController < ApplicationController
  def index
  end
  
  def results

    @user = User.find(params[:id])
    if params[:q] == "top rated"
      @movies = MovieFacade.top_rated
    end
  end

  def show
    @user = User.find(params[:user_id])
    @movie = MovieFacade.find_movie(params[:id])
  end
end
