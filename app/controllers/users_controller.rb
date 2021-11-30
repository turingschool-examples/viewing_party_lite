class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      flash[:notice] = "Welcome #{user.name}"
      redirect_to dashboard_path(user)
    else
      flash[:alert] = "Could not create user. Please try again."
      redirect_to registration_path
    end
  end
  
  def show
    @user = User.find(params[:user_id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

end
