
class UsersController < ApplicationController 
  def new 
    @user = User.new
  end

  def show 
    @user = User.find(params[:id])
  end

  def create 
    # user = User.find_by_email(params[:email])
    user = User.new(user_params)
    if user.save 
      session[:user_id] = user.id
      redirect_to "/users/#{user.id}"
      flash[:success] = "Welcome, #{user.email}!"
    else
      redirect_to "/register"
      flash[:error] = user.errors.full_messages
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
