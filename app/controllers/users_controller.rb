class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def discover
    @user = User.find(params[:user_id])
  end

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to(user_path(user))
    else
      redirect_to('/register')
    end
    #add flash messages here
  end

  private

  def user_params
    params.permit(:name, :email)
  end
end