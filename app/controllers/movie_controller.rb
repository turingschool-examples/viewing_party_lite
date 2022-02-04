class MovieController < ApplicationController 
  def index
    @user = User.find(params[:user_id])
    if params["keyword"].present?
      @top_rated = TmdbFacade.keyword(params["keyword"])
    else
      @top_rated = TmdbFacade.top_rated_movies
    end 
  end

  def show 
    @user = User.find(params[:user_id])
    @movie = TmdbFacade.details(params[:id])
  end
end