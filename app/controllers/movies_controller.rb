class MovieController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    # @movies = MovieFacade.all 
    @top_rated = if params['keyword'].present?
      MovieFacade.keyword(params['keyword'])
    else 
      MovieFacade.top_movies 
    end 
  end
end