class UsersController < ApplicationController

  def register
    @user = User.new
  end

  # def new
  #   # @user = User.new
  # end

  def create
    user = User.new(user_params)
    if user.save
      # redirect_to "/users/#{user.id}" updating once there is user show page
      redirect_to "/register"
    else
      redirect_to "/register"
      flash[:alert] = "Error: #{error_message(user.errors)}"
    end
  end

  private 
  def user_params
    params.permit(:name, :email)
  end


end