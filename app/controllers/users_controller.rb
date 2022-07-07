class UsersController < ApplicationController
  def new
    @user = User.new
  end


  def show
    @user = User.find(params[:id])
  end

  def create
    new_user = User.create(user_params)
    if new_user.save
      redirect_to user_path(new_user.id), notice: "Welcome, #{new_user.name}!"
    else
      redirect_to register_path, alert: "Cannot register, missing or repeated information"
   end 
  end

  def show
    @user = User.find(params[:id])
  end

  def discover
    @user = User.find(params[:id])
  end

private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
