# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new; end

  def create
    User.create(new_user_params)
    @user = User.where(email: new_user_params[:email]).first
    redirect_to "/users/#{@user.id}"
  end

  private

  def new_user_params
    params.permit(:name, :email)
  end
end
