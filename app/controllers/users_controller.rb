class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    if user.save
      flash[:alert] = "Your account was created"
      redirect_to user_path(user.id)
    else
      flash[:alert] = "Error: #{error_message(user.errors)}"
      redirect_to register_path
    end
  end


  def show
    @user = User.find(params[:id])
    @my_hosting = Party.where(user_id: "#{@user.id}")
    @my_invitations = @user.parties
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
