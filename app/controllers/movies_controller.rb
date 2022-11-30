class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @movies = MoviesFacade.top_rated
  end
end