class UsersController < ApplicationController
  def create
  end

  def dashboard
    @user = User.find(params[:id])
  end
end
