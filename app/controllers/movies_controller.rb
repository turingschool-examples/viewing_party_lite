class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    if params[:top_rated]
      @movies = MoviesFacade.top_rated
    else
      @movies = MoviesFacade.search(params[:search])
    end
  end
end