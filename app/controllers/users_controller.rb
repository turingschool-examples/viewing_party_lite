# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new; end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to "/users/#{user.id}"
    else
      redirect_to '/register'
      flash[:alert] = user.errors.full_messages.to_sentence
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
