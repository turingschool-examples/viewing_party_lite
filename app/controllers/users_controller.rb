class UsersController < ApplicationController
  def new
  end

  def create
    user = User.create(user_params)
    if user.save
      redirect_to "/users/#{user.id}"
    else
      flash[:notice] = "Please enter a valid name and email address to register."
      redirect_to "/register"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def discover
  end

  def user_params
    params.permit(:name, :email)
  end
end
