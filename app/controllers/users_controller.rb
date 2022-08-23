class UsersController < ApplicationController
  def landing
    @users = User.all
  end

  def new
    new = User.create(name: params[:name], email: params[:email])
    redirect_to "/users/#{new.id}"
  end

  def register

  end

  def show
    @user = User.find(params[:user_id])
  end

  def discover
    @user = User.find(params[:user_id])
  end
end
