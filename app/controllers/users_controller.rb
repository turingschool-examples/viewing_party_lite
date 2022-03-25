class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.create!(user_params)
    redirect_to user_path(user.id)
    flash[:alert] = "Your account was created"
  end

  def show
    @user = User.find(params[:id])
    @my_hosting = Party.where(user_id: "#{@user.id}")
    @my_invitations = @user.parties
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
