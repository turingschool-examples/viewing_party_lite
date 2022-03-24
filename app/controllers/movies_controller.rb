class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @movies = MovieFacade.top_movie if params[:q].present?
  end
end
