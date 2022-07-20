class UsersController < ApplicationController

  def new
    @user = User.new
  end
  
  def create
    user = user_params
    user[:email] = user[:email].downcase
    new_user = User.new(user)
    if new_user.save
      session[:user_id] = new_user.id
      flash[:success] = "Welcome, #{new_user.email}!"
      redirect_to "/users/#{new_user.id}"
    else
      redirect_to '/register'
      flash[:error] = new_user.errors.full_messages
    end
  end

  def login
  end

  def login_user
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.email}!"
      redirect_to user_path(user.id)
    else
      flash[:error] = "Sorry, invalid login."
      render :login
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private
    def user_params
      params.permit(:name, :email, :password, :password_confirmation)
    end
end