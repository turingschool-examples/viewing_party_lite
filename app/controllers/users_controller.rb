class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create!(user_params)
    redirect_to "/users/#{@user.id}"
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
