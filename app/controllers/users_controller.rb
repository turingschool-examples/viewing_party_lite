# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new; end

  def discover
    @user = User.find(params[:user_id])
  end

  def create
    User.create!(user_params)
    redirect_to "/users/#{User.last.id}"
  end

  private

  def user_params
    params.permit(:name, :email)
  end
end
