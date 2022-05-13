class MoviesController < ApplicationController
  def show
    @user = User.find(params[:user_id])
    @movie = MovieService.get_movie(params[:movie_id])
    @cast = MovieFacade.top_10_cast(params[:movie_id])
    @reviews = MovieFacade.reviews(params[:movie_id])
  end

  def new
  end
end
