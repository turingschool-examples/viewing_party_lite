class MoviesController < ApplicationController
  def show 
    @user = User.find(params[:user_id])
    @movie = MovieFacade.movie_data(params[:id])
    @cast = MovieFacade.cast_data(params[:id])
    @reviews = MovieFacade.review_data(params[:id])
  end
  def index; end
end
