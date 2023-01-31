class UsersController < ApplicationController
  def show
  end
  
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    
    if user.save
      flash[:notice] = "User successfully created"
      redirect_to user_path(user.id)
    else
    end
  end

private

  def user_params
    params.require(:user).permit(:name, :email)
  end

  
end