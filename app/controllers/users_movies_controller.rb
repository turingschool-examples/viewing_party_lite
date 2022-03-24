class UsersMoviesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    if params[:top_rated] == "top_rated"
      @top_movies = TopRated.new.movies
    elsif params[:search]
      @movies = MovieSearch.new.search(params[:search])
    end 
  end

  def show
  end
end
