class MoviesController < ApplicationController 
  def index 
    @user = User.find(params[:user_id])
    @movies = MovieFacade.create_top_movies
  end
end