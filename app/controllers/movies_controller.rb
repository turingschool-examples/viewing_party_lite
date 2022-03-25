class MoviesController < ApplicationController
  def index
    @movies = MovieFacade.keywords(params[:search])
  end

  def show
    @user = User.find(params[:user_id])
    @movie = MovieFacade.get_movie(params[:id])
  end
end
