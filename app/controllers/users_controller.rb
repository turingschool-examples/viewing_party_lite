
class UsersController < ApplicationController 
  def new 
    @user = User.new
  end

  def show 
    @user = User.find(params[:id])
  end

  def create 
    # user = User.find_by_email(params[:email])
    new_user = User.create(user_params)
    if new_user.save 
      redirect_to "/users/#{new_user.id}"
      flash[:success] = "Welcome, #{new_user.email}!"
    else
      redirect_to "/register"
      flash[:error] = new_user.errors.full_messages
    end
  end

    # if user 
    #   flash[:alert] = "That email address is already registered."
    #   redirect_to "/register"
    # elsif
    #   @user = User.create(user_params)
    #   # require 'pry'; binding.pry 
    #   # flash[:success] = "Welcome, #{@user.email}!"
    #   redirect_to "/users/#{@user.id}"
    # else
    #   flash[:error] = new_user.errors.full_messages
    #   redirect_to "/register"
    # end
  # end
  def discover
    @user = User.find(params[:id])
  end

private 
def user_params 
    params.permit(:name, :email, :password)
end
end
