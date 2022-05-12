class UsersController < ApplicationController
  def create
    @user = User.create!({name: params[:name], email: params[:email]})
    redirect_to "/users/#{@user.id}"
  end

  def new
  end

  def show
    @user = User.find(params[:id])
  end

  def discover
    @top_movies = MovieFacade.top_rated_movies
    # if params[top_rated]
    #   do this
    # elsif params[search]
    #   do this other thing
    # end
  end
end
