class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  
  def discover_movies
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    user = User.create!(name: params[:name], email: params[:email])
    flash.notice = 'User has been created!'
    redirect_to user_path(user)
  end
end