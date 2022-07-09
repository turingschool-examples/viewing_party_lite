class UserMoviesController < ApplicationController
  def index
    @top_movies = MoviesFacade.top_rated
  end

  def search
    user = User.find(params[:id])
    keyword = params[:search]
    @search_results = MoviesFacade.search(keyword)
    redirect_to "/users/#{user.id}/movies"
  end
end
