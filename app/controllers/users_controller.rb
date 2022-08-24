class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  
  def new
  end

  def create
    user = User.create!(user_params)
    # binding.pry
    redirect_to user_path(user.id)
  end

  def user_params
    params.permit(:name, :email)
  end
end
