class UsersController < ApplicationController
  def dashboard
    @user = User.find(params[:id])
  end

  def discover
    @user = User.find(params[:id])
  end

  def movies
    @user = User.find(params[:id])
    if params[:search] && params[:search] = ""
      redirect_to "/users/#{@user.id}/discover"
    elsif params[:search]
      @movies = MovieDbFacade.search_movies(params[:search])
    else
      @movies = MovieDbFacade.top_20_movies
    end
  end

  def create
    user = User.new(user_params)
    if User.find_by(email: user.email)
      redirect_to register_path
      flash[:alert] = 'Email Already in Use'
    elsif user.save
      redirect_to "/users/#{user.id}"
    else
      redirect_to register_path
    end
  end

  private

  def user_params
    params.permit(:name, :email)
  end
end
