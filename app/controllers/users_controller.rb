class UsersController < ApplicationController
  before_action :find_user, only: [:show, :discover]

  def show; end

  def new
    @user = User.new
  end

  def create
    @user = User.create!(user_params)
    redirect_to "/users/#{@user.id}"
  end

  def discover; end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
