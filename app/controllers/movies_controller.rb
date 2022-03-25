class MoviesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @movies = MovieFacade.top_rated_movies
  end

  def show
    @movies = MovieFacade.movie_details(params[:movie_id])
  end
end
