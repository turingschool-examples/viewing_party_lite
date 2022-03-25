class MoviesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @movies = MovieFacade.top_rated_movies
  end

  def show
    @movie = MovieFacade.movie_details(params[:id])
    @user = User.find(params[:user_id])

  end
end
