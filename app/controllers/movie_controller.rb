class MovieController < ApplicationController 
  def index
    @user = User.find(params[:user_id])
    @top_rated = TMDBFacade.top_rated_movies
  end
end