class PartiesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @users = User.where("users.id != ?", @user.id)
    @movie = MovieFacade.movie_details(params[:movie_id])
  end
end
