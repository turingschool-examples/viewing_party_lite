class UsersController < ApplicationController

  def new
  end

  def create
    user = User.create(user_params)

    if user.save
      redirect_to "/users/#{user.id}"
    else
      redirect_to "/register"
      flash[:alert] = "Error: #{error_message(user.errors)}"
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
