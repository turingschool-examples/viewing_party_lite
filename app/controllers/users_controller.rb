class UsersController < ApplicationController

  def new
    # @user = User.new
  end

  def create
    user = User.new(name: params[:name], email: params[:email])

    if user.save
      redirect_to "/users/#{user.id}"
    else
      redirect_to "/register"
      flash[:alert] = "ERROR: #{error_message(user.errors)}"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def discover
    @user = User.find(params[:id])
  end

  def movies
    @user = User.find(params[:id])

    if params[:q] == 'top rated'
      @movies = MovieFacade.top_movies
    elsif params[:q] == 'keyword'
      @movies = MovieFacade.lookup(params[:title])
    end
  end

  def movie_show
    @user = User.find(params[:id])
    @movie = MovieFacade.details(params[:movie_id])
  end
end
