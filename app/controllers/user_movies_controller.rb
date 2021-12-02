class UserMoviesController < ApplicationController


  def show
    @user = User.find(params[:id])
    @movie = MovieService.movie_details(params[:movie_id])
    @reviews = MovieService.get_reviews(params[:movie_id])
    @cast = MovieService.get_cast(params[:movie_id])
  end
end
