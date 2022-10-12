class Users::MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    if params[:top_rated]
      @movies = MoviesFacade.top_rated
    elsif params[:search]
      @movies = MoviesFacade.search(params[:search])
    end
  end

  def show
    require 'pry' ; binding.pry
  end
end