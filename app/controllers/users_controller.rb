
class UsersController < ApplicationController 
  def new 
  end

  def show 
    @user = User.find(params[:id])
  end

  def create 
    user = User.find_by_email(params[:email])
    if user 
    # if User.exists?(params[:email])
      flash[:alert] = "That email address is already registered."
      redirect_to "/register"
    else
      @user = User.create!(user_params)
      # require 'pry'; binding.pry 
      redirect_to "/users/#{@user.id}"
    end
  end

  def discover
    @user = User.find(params[:id])
  end

private 
  def user_params 
    params.permit(:name, :email)
  end
end
