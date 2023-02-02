class Users::MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    if params[:q] == "top_rated"
      @movies = MovieFacade.top_rated_movies
  end

  def show
  end
end
