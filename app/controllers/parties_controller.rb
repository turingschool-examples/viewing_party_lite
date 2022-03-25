class PartiesController < ApplicationController
  def new
    @users = User.all
    @user = User.find(params[:user_id])
    @movie = MovieFacade.get_movie(params[:movie_id])
  end 

  def create
    @user = User.find(params[:user_id])
    redirect_to "/users/#{@user.id}"
  end
end
