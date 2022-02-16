class MovieController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @top_rated = if params['keyword'].present?
                   TmdbFacade.keyword(params['keyword'])
                 else
                   TmdbFacade.top_rated_movies
                 end
  end

  def show
    @user = User.find(params[:user_id])
    @movie = TmdbFacade.details(params[:id])
    @reviews = TmdbFacade.reviews(params[:id])
  end
end
