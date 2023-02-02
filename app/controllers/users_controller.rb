class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
   user = User.new(permitted_params)
   
    if user.save 
      redirect_to user_path(user)
    else
      redirect_to '/register'
      flash[:alert] = 'User was not created'
    end
  end

  private 

  def permitted_params
    params.require(:user).permit(:name, :email)
  end
end
