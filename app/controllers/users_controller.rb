class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(name: params[:name], email: params[:email])
    if user.save
      redirect_to "/users/#{user.id}"
    else
      flash[:notice] = "Please enter a valid name and email address to register."
      redirect_to "/register"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def discover
  end
end
