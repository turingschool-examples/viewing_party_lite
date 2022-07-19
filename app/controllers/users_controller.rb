# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :find_user, only: %i[discover]

  def new; end

  def create
    user = User.create(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/dashboard'
    else
      redirect_to '/register'
      flash[:error] = user.errors.full_messages
    end
  end

  def show
    if current_user
      @user = find_user
    else
      flash[:error] = 'Please log in to access your dashboard!'
      redirect_to '/'
    end
  end

  def discover; end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def find_user
    @user = User.find(session[:user_id])
  end
end
