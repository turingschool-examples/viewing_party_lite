class MoviesController < ApplicationController
  def discover
   @user = User.find(params[:id])
  end
  def index
    @movies = MoviesSearch.new.movies
    @user = User.find(params[:id])
  end
end