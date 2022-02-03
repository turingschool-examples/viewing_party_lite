class MovieController < ApplicationController 
  def index
    @user = User.find(params[:user_id])
    if params["keyword"].present?
      @top_rated = TMDBFacade.keyword(params["keyword"])
    else
      @top_rated = TMDBFacade.top_rated_movies
    end 
  end
end