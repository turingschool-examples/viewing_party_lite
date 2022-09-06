class UsersController < ApplicationController
  def index
    @users = User.all
  end

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
        redirect_to register_path
        flash[:alert] = @user.errors.full_messages.to_sentence
      end
  end

  def discover
    @user = User.find(params[:id])
  end

  private
    def user_params
      # params.require(:user).permit(:name, :email, :password, :password_confirmation)
      params.permit(:name, :email, :password, :password_confirmation)
    end
end
