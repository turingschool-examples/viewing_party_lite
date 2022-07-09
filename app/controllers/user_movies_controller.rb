class UserMoviesController < ApplicationController
  def index
    @top_movies = MoviesFacade.top_rated
  end

  def search
    keyword = params[:search]
    @search_results = MoviesFacade.search(keyword)
  end
end
