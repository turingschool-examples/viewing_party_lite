class UsersController < ApplicationController
  def new
    
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to "/users/#{@user.id}"
    else
      redirect_to "/register"
      flash[:alert] = "Email address already in use"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def discover
  end

  private
  def user_params
    params.permit(:name, :email)
  end
end