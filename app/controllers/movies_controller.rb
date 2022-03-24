class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])

    @top_movies = TopMovieFacade.top_movie if params[:q].present?
  end
end
