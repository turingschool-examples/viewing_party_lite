# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.create!(user_params)
    redirect_to user_path(user.id)
  end

  def show
    @user = User.find(params[:id])
  end

  def discover
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.permit(:name, :email)
  end
end
