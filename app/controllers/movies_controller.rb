class MoviesController < ApplicationController

  def index
  end

  def show
    @user = User.find(params[:user_id])
    @movie = MovieFacade.new_movie_details(params[:id])
  end

end