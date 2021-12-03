class MoviesController < ApplicationController

  def show
    @user = User.find(params[:user_id])
  end

  def new
    @user = User.find(params[:id])
  end

  def index
    @user = User.find(params[:id])
    @movies = MovieFacade.find_popular_movies
  end
end
