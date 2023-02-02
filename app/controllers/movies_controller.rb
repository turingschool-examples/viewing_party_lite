class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @movies =MovieService.discover_movie(params[:q])
  end

  def show
    @user = User.find(params[:user_id])
    @movie = MovieFacade.movie_details(params[:id])
    @actors = MovieFacade.actors(params[:id])
    @reviews = MovieService.review_details(params[:id])
  end

  private

  # def movie_params
  #   params
  # end
end