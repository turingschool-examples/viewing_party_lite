class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to "/users/#{user.id}"
    else
      redirect_to '/register' #, notice: "Error: This email has already been registered"
      flash[:alert] = "Error: This email has already been registered"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.permit(:name, :email)
  end
end