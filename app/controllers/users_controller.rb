class UsersController < ApplicationController

  def new
    
  end
  

  def create
    user = User.create(user_params)
    redirect_to "/users/#{user.id}"
    flash[:success] = "Welcome, #{user.username}!"
  end

  def show
    @user = User.find(params[:id])
  end

  private
    def user_params
      params.permit(:name, :email, :username, :password)
    end
end