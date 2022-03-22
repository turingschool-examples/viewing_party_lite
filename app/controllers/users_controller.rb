class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to "/users/#{user.id}"
    else
      redirect_to '/register', notice: "Please kindly fill in all fields with valid email"
    end
  end

  def show

  end

  private

  def user_params
    params.permit(:name, :email)
  end
end
