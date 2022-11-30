class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    new_user = User.create(user_params)
    if new_user.exists?
      redirect_to user_path(new_user)
    else
      render '/register'
    end
  end

  private

  def user_params
    params.permit(:name, :email)
  end
end
