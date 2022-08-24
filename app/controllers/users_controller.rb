
class UsersController < ApplicationController 
  def new 
  end

  def show 
    @user = User.find(params[:id])
  end

  def create 
    if User.exists?(params[:email])
      flash.alert = "That email address is already registered."
    else
      @user = User.create!(user_params)
      # require 'pry'; binding.pry 
      redirect_to "/users/#{@user.id}"
    end
  end

private 
  def user_params 
    params.permit(:name, :email)
  end
end
