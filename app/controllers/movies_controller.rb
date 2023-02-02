class MoviesController < ApplicationController
  def show
    @user = User.find(params[:user_id])
    @movie = MovieFacade.get_movie(params[:id])
    @cast = MovieFacade.top_cast(params[:id])
    # @reviews = MovieFacade.reviews(params[:id])
  end
end