class ViewingPartyController < ApplicationController

  def new
    @movie = MovieFacade.movie_details(params[:movie_id])
    @user = User.find(params[:user_id])
    @users = User.all
  end

  def create
    @user = User.find(params[:user_id])
    redirect_to user_path(@user.id)
  end
end
