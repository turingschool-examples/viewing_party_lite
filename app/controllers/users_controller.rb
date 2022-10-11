class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  
  def new
  end

  def create
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end

end
