# require 'bcrypt'

class UsersController < ApplicationController
  # include BCrypt
  def new
    @user = User.new()
  end

  def create
    # user = user_params
    # user[:email] = user[:email].downcase
    # user = User.new(user)
    user = User.create(user_params)
    if user.save
      flash[:success] = "Welcome, #{user.name}!"
      redirect_to "/users/#{user.id}"
    elsif
      flash[:alert] = user.errors.full_messages.to_sentence
      redirect_to '/register'
    end
  end

  def show
    @user = User.find(params[:id])
    @hosted = @user.hosted_parties
    @invited = @user.invited_parties
  end

  def discover
    @user = User.find(params[:id])
  end

  def login_form

  end

  def login_user
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      flash[:alert] = "Welcome, #{user.name}!"
      redirect_to "/users/#{user.id}"
    else 
      flash[:error] = "Wrong Email/Password"
      redirect_to "/login" 
    end 
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)

  end
end
