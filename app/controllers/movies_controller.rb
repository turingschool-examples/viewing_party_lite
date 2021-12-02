class MoviesController < ApplicationController

  def new
    @user = User.find(params[:id])
  end

  def index
    @movies = MovieFacade.find_popular_movies
  end
end
