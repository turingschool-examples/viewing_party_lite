class MoviesController < ApplicationController
  def discover
  end

  def show
    @user = User.find(params[:id])
    @movie = MovieFacade.movie_info(params[:movie_id])
  end
end