class MoviesController < ApplicationController

  def new
    @user = User.find(params[:id])
  end

  def index
    @user = User.find(params[:id])
    @movies = MovieFacade.find_popular_movies
  end

  def show
    @user = User.find(params[:user_id])
    @movie = MovieFacade.get_movie_details(params[:id])
  end
end
