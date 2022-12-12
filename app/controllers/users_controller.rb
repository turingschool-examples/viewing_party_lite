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
      flash[:errors] = @user.errors.full_messages
      
      redirect_to register_path
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password)
  end
end
