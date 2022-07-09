class UserMoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    if params[:search].present?
      keyword = params[:search]
      @search_results = MoviesFacade.search(keyword)
    else
      @top_movies = MoviesFacade.top_rated
    end

  end

  def show
    @user = User.find(params[:user_id])
  end
end
