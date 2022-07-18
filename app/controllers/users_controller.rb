class UsersController < ApplicationController

  def new
    
  end
  

  def create
    user = User.new(user_params)
    # checks to see if user can be saved, and will save it if possible
    if user.save 
      redirect_to "/users/#{user.id}"
      flash[:success] = "Welcome, #{user.username}!"
    else 
      redirect_to '/register'
      user.errors.full_messages.each do |message|
        flash[:failure] = message
      end
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