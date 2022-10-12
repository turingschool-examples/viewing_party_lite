class MoviesController < ApplicationController
  def show
    @user = User.find(params[:id])
    @movie = MovieFacade.movie_by_id(params[:movie_id])
  end
end