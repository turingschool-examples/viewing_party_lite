# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new; end

  def create
    user = User.create!(user_params)
    redirect_to user_path(user.id)
  end

  def user_params
    params.permit(:name, :email, :password)
  end
end
