class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    unless params[:search] == ""
      if params[:search]
        @movies = MoviesFacade.searched_movies(params[:search])
      else
        @movies = MoviesFacade.top_rated_movies
      end
    else
      redirect_to user_discover_path(@user)
      flash[:alert] = "Search Field Can't Be Blank"
    end
  end

  def show
    @movie = MoviesFacade.movie_details(params[:id])
    @user = User.find(params[:user_id])
  end
end
