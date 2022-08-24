class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
  end

  def create
    User.create!(user_params)
    redirect_to '/'
  end

  private

  def user_params
    params.permit(:name, :email)
  end

end
