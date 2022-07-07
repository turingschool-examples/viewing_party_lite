class UserMoviesController < ApplicationController

  def show
    @user = User.find(params[:user_id])
    @movie = MovieFacade.find_movie(params[:movie_id])
    # binding.pry
  end

end