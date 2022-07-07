class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
  end

  def show
    @user = User.find(params[:id])
  end

  def discover
    # redirect_to "/users/#{params[:id]}/discover"
  end

  def create
    new_user = User.new(name: params[:name], email: params[:email])
    if new_user.save
      redirect_to "/users/#{new_user.id}"
    else
      redirect_to '/register', notice: "A required field was missing or email is already in use"
    end
  end
end
