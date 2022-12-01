class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @movies = MoviesFacade.top_rated
  end

  def show
    @user = User.find(params[:user_id])
    @movie = MovieHeavy.new(MoviesService.details(params[:id]))
  end
end