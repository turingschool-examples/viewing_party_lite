class UsersController < ApplicationController
  # def index
  #   @users = User.all
  # end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    redirect_to "/users/#{user.id}"
  end

  private

  def user_params
    params.permit(:name, :email)
  end
end
