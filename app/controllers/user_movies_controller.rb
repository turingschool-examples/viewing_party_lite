class UserMoviesController < ApplicationController

  def show
    @user = User.find(params[:user_id])
    @movie = MovieFacade.movie_details(params[:movie_id])
  end

end