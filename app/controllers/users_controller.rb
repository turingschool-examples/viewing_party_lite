class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)

    if user.save
      flash[:notice] = "User successfully created"
      redirect_to user_path(user.id)
    else
      flash[:alert] = "User creation failed"
      @user = User.new(user_params)
      render :new
    end
  end

  def discover
    @user = User.find(params[:user_id])
  end

  def movies

  end

  def search
    user = User.find(params[:user_id])
    redirect_to user_movies_path(user)
  end

private

  def user_params
    params.require(:user).permit(:name, :email)
  end

  
end