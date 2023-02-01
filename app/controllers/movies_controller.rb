class MoviesController < ApplicationController
  def show
    @user = User.find(params[:user_id])
    @movie = Movie.find(params[:id])
  end
end