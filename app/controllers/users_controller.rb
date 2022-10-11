class UsersController < ApplicationController

  def welcome
    @users = User.all
  end

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to '/register'
      flash[:alert] = "Error: #{@user.errors.full_messages.first}"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def discover
    @user = User.find(params[:id])
  end

  def results
    @user = User.find(params[:id])
    @movies = MovieFacade.get_movies(params["Search by Movie Title"])
  end

  private 
  def user_params
    params.permit(:email, :name, :password)
  end

  def set_user
    @user = current_user
  end
end
