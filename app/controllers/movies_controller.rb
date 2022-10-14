class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    if params[:search]
      @movies = MoviesFacade.searched_movies(params[:search])
    else
      @movies = MoviesFacade.top_rated_movies
    end
  end

  def show
    @movie = MoviesFacade.movie_details(params[:id])
    @user = User.find(params[:user_id])
  end
end
