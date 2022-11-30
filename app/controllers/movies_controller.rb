class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])

    if params[:top_rated]
      @movies = MovieFacade.top_rated
    elsif params[:search]
      @movies = MovieFacade.searched_movies(params[:search])
    end
  end

  def show
    binding.pry
  end
end