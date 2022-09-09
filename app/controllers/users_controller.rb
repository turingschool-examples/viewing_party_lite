class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    # @user = User.find(session[:user_id])
    if current_user.nil?
      redirect_to root_path
      flash[:notice] = "You must login or register to visit your dashboard."
    end
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/dashboard'
      flash[:success] = "Welcome, #{user.name}!"
    else
      redirect_to '/register'
      flash[:error] = user.errors
    end
  end

  def discover
    # @user = User.find(params[:id])
    @user = User.find(session[:user_id])
  end

  def login_user
    user = User.find_by(email: params[:email]) 
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.name}"
      redirect_to '/dashboard'
      else
      flash[:error] = "Invalid Credentials. Please try to login again."
      render :login_form
    end
  end

  private

  def user_params
    params.permit(:name.downcase, :email, :password, :password_confirmation)
  end
end
