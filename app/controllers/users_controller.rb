class UsersController < ApplicationController


  def show
     @user = User.find(params[:id])
  end

  def new

  end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.permit(:name, :email)
  end
end
