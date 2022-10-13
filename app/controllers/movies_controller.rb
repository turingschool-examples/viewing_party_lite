class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @movies = if params[:search].present?
      MovieFacade.movie_search(params[:search])
    else
      MovieFacade.top_rated
    end
  end
end
