class UsersController < ApplicationController

  def register
    @user = User.new
  end

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    #redirect will be added later
  end

  private 
  def user_params
    params.permit(:name, :email)
  end


end