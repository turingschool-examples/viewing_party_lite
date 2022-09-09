# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new; end

  def create
    user = User.create!(user_params)
    if user.save
      redirect_to user_path(user.id)
      flash[:success] = "Welcome, #{user.name}"
    else
      redirect_to register_path
      flash[:error] = "Email or password are invalid"
    end
  end

  def user_params
    params.permit(:name, :email, :password)
  end
end
