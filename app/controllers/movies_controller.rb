class MoviesController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    if params[:q] == "top%20rated"
      @top_20 = MovieFacade.top_20
    elsif params[:q]
      @search_results = MovieFacade.search_results(params[:q])
    end
  end

  def show
    @user = User.find(session[:user_id])
    @movie_details = {
      movie: MovieFacade.details(params[:id]),
      cast: MovieFacade.cast_members(params[:id]),
      reviews: MovieFacade.reviews(params[:id])
    }
  end
end
