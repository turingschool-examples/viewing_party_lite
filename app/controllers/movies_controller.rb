class MoviesController < ApplicationController
  def show
    @user = User.find(params[:user_id])
    @movie = params[:movie_id]
  end

  def new
  end
end
