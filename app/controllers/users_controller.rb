class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      redirect_to register_path
      flash[:alert] = "Error: Email already linked with an account"
    end
  end

  private

  def user_params
    params.permit(:name, :email)
  end
end
