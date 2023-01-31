# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.create!(user_params)
    user[:email].downcase!
    user.save!
    redirect_to user_path(user.id)
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
