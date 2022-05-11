class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    if params[:q] == "top%20rated"
      @top_20 = MovieFacade.top_20
    elsif params[:q]
      @search_results = MovieFacade.search_results(params[:q])
    end
  end

  def show
    @user = User.find(params[:user_id])
    @movie = MovieFacade.details(params[:id])
    @cast = CastMemberFacade.cast_members(params[:id])
    @reviews = ReviewFacade.reviews(params[:id])
  end
end
