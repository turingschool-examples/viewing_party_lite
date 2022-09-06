
class UsersController < ApplicationController 
  def new 
    @user = User.new
  end

  def show 
    @user = User.find(params[:id])
  end

  def create 
    user = User.find_by_email(params[:email])
    if user 
      flash[:alert] = "That email address is already registered."
      redirect_to "/register"
    else
      @user = User.create(user_params)
      flash[:success] = "Welcome, #{@user.email}!"
      redirect_to "/users/#{@user.id}"
    end
  end
  def discover
    @user = User.find(params[:id])
  end

private 
def user_params 
    params.permit(:name, :email, :password)
end
end
