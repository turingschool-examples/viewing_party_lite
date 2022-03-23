class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to "/"
    else
      redirect_to "/register"
      flash[:alert] = "Error: Email already registered"
    end
  end

  private
    def user_params
      params.permit(:name, :email)
    end
end
