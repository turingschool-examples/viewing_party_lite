class UsersController < ApplicationController
  def new

  end

  def show

  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      redirect_to new_register_path
      flash[:alert] = "Error: "
    end
  end

private

  def user_params
    params.permit(:name, :email)
  end
end
