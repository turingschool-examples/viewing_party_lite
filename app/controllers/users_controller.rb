class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
  end


private
  def user_params
    params.permit(:name, :email)
  end
end
