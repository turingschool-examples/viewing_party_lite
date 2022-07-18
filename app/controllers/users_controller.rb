class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def discover
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    if user.save
      redirect_to user_path(user.id)
      flash[:notice] = "Welcome #{user.name}"
    else
      flash[:error] = user.errors.full_messages
      redirect_to register_path
    end
  end

  def login; end

  def login_user
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      redirect_to user_path(user.id)
    else
      flash[:error] = 'Credentials invalid'
      redirect_to login_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
