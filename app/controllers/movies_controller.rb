class MoviesController < ApplicationController

  def discover
    @user = User.find(params[:user_id])
  end

  def index

  end

  def show
    @user = User.find(params[:user_id])
    @movie = MoviesFacade.get_movie(params[:id])
  end
  
end