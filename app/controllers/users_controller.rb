class UsersController < ApplicationController 
  def new   
  end

  def show #user Dashboard
    @user = User.find(params[:id])
  end
end