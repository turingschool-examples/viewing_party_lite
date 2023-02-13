# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(permitted_params)
    if user.save
      redirect_to user_path(user)
    else
      redirect_to '/register'
      flash[:alert] = user.errors.full_messages.to_sentence
    end
  end

  def login_user 
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.name}!"
      redirect_to user_path(user)
    else
      flash[:error] = "Sorry, your credentials are bad"
      render :login_form
    end
  end

  private

  def permitted_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
