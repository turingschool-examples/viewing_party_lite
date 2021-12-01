class UserMoviesController < ApplicationController


  def show
    @user = User.find(params[:id])
    @movie = MovieService.movie_details(params[:movie_id])
  end
end
