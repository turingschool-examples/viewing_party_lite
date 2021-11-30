class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
  end

  def create
    user = User.new(user_params)

    if user.save
      redirect_to user_path(user)
    else
      flash[:alert] = "Could not create user"
      redirect_to new_user_path
    end
  end

  private

  def user_params
    params.permit(:name, :email)
  end
end
