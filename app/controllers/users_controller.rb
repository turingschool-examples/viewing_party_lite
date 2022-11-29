class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    
  end

  def create
    user = User.create!(user_params)
    redirect_to "/users/#{user.id}"
  end

  def show
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.permit(:name, :email)
  end
end