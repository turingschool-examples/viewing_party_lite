class MoviesController < ApplicationController
  before_action :require_user
  
  def index
    if params[:q] == "top-rated"
      @top_movies = MovieFacade.top_rated
    elsif params[:q]
      @searched_movies = MovieFacade.search(params[:q])
    end
  end

  def show
    # @user = User.find(params[:user_id])
    @movie = MovieFacade.movie_details(params[:id])
  end
end
