class UserMoviesController < ApplicationController
  def details
    @user = User.find(params[:id])
    if params[:q] == "top rated"
      @top_rated = MovieFacade.top_rated
    elsif params[:search] && params[:search] != (nil || "")
      @search_results = MovieFacade.movie_search(params[:search])
    else
      flash.alert = "No Results Found"
    end
  end
end