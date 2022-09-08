class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to "/users/#{user.id}"
      flash[:success] = "Welcome, #{user.name}!"
    else
      redirect_to '/register'
      flash[:error] = user.errors.full_messages.to_sentence
    end
  end

  def discover
    @user = User.find(params[:id])
  end

  def login_user
    user = User.find_by(email: params[:email]) 
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.name}"
      redirect_to "/users/#{user.id}"
      else
      flash[:error] = "Your login information is incorrect. Please try to login again."
      render :login_form
    end
  end

  private

  def user_params
    params.permit(:name.downcase, :email, :password, :password_confirmation)
  end
end
