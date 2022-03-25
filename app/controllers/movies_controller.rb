class MoviesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @top_movies = MovieFacade.top_rated_movies
  end

  def show
    
  end

end
