class UsersController < ApplicationController

  def welcome
    @users = User.all
  end

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
      flash[:notice] = "Welcome #{@user.name}"
    elsif params[:password] != params[:password_confirmation]
      flash[:failture] = "Error: Password doesn't match."
      render :new
    else
      flash[:failure] = @user.errors.full_messages.first
      render :new
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
    params.permit(:email, :name, :password, :password_confirmation)
  end

  def set_user
    @user = current_user
  end
end
