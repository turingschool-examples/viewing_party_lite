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
        flash[:alert] = "Error: That email is already associated with an account."
      end
  end

  private
    def user_params
      params.permit(:name, :email, :password)
    end
end
