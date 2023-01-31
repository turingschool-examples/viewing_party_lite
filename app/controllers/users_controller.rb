class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  
  def discover_movies
    @user = User.find(params[:id])
  end


end