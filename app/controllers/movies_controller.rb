class MoviesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @movies = MovieFacade.top_rated_movies
  end
end
