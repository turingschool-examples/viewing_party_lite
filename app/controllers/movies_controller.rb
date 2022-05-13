class MoviesController < ApplicationController
  def show
  end

  def discover
    @user = User.find(params[:id])
    redirect_to "users/#{@user.id}/movies"
  end

  def results
    @user = User.find(params[:id])
    if params[:q] == "top rated"
      @top_movies = MovieFacade.top_rated_movies
    elsif params[:keyword].present?
      @search_results = MovieFacade.search_movies(params[:keyword])
    end
  end

#   Pseudo coding discover / results:
#
# Need results page, and need a discover page
#
# Discover page has two options which leads to the results page :
#
# 1. Search bar to search movies by exact title
# 2. A button / link to the top 20 movies list.
#
# Results page has two different sets of information depending on how it was navigated to.
#
# Results page is either a list of top 20 movies OR a matched results for the search function.
end
