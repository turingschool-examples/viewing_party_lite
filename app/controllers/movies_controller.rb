class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    if params[:search]
      @movies = MoviesFacade.searched_movies
    else
      @movies = MoviesFacade.top_rated_movies
    end
  end
end