class UsersController < ApplicationController
  def index; end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def discover
    @user = User.find(params[:user_id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      flash[:alert] = "Error: #{error_message(@user.errors)}"
      redirect_to '/register'
    end
  end

  private

  def user_params
    params.permit(:name, :email)
  end
end
