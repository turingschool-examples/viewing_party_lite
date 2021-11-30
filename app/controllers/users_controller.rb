class UsersController < ApplicationController
  def show
  end
  
  def new
  end

  def create
    user = User.create(user_params)
    redirect_to user_path(user)
  end

  private

  def user_params
    params.permit(:name, :email)
  end
end