class UsersController < ApplicationController
  def new

  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      flash[:alert] = @user.errors.full_messages
      redirect_to new_register_path
    end
  end

private

  def user_params
    params.permit(:name, :email)
  end
end
