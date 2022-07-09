class UserMoviesController < ApplicationController
  def index
    if params[:search].present?
    keyword = params[:search]
    @search_results = MoviesFacade.search(keyword)
    else
    @top_movies = MoviesFacade.top_rated
    end
  end
end
