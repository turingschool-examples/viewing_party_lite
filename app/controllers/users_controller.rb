class UsersController < ApplicationController
  def show; end

  def new
    @user = User.new
  end

  def create
    User.create(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
