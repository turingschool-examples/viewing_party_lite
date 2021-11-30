class UserController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)

    if user.save
      redirect_to user_path(user)
    else
      redirect_to register_path
      flash[:alert] = "Please enter valid data"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.permit(:name, :email)
  end
end
