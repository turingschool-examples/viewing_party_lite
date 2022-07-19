# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :find_user, only: [:show, :discover]

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
    # @user = User.find(params[:id])
  end

  def discover
    # @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def find_user
    @user = User.find(session[:user_id])
  end
end
