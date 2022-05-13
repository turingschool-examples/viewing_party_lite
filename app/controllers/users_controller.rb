class UsersController < ApplicationController
  def new

  end

  def show
    @user = User.find(params[:id])
  end

  def create
    user = User.create(user_params)
    redirect_to "/users/#{user.id}"
  end

  private

  def user_params
      params.permit(:name, :email)
  end
end
