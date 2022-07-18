class UsersController < ApplicationController

  def new
    
  end
  

  def create
    user = User.create(user_params)
    if user.save
      redirect_to "/users/#{user.id}"
      flash[:success] = "Welcome, #{user.username}!"
    else User.all == []
      redirect_to '/register'
      flash[:failure] = user.errors.full_messages.first
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private
    def user_params
      params.permit(:name, :email, :username, :password, :password_confirmation)
    end
end