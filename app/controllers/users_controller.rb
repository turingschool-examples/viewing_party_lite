# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def discover
    @user = User.find(params[:id])
  end

  def new; end

  def create
    user = User.new(user_params)

    if user.save
      redirect_to "/users/#{user.id}"
    else
      redirect_to '/register'
      flash[:alert] = 'Error: Please fill in all fields.  Email must be unique.'
    end
  end

  def login_form

  end

  def login_user
    user = User.find_by(email: params[:email])
    if user.authenticate(params[:password])
      session[:user_id] = user.id 
      flash[:success] = "Welcome, #{user.name}!"
      redirect_to "/users/#{user.id}"
    else 
      flash[:error] = "Sorry, your credentials are bad."
      render :login_form
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
