class UserMoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    if params[:search].present?
      keyword = params[:search]
      @search_results = MoviesFacade.search(keyword)
    # elsif params[:search] = ""
    #   redirect_to "/user/#{@user.id}/discover"
    #   flash[:alert] = "Please enter a word found in the movie title for which you are searching"
    else
      @top_movies = MoviesFacade.top_rated
    end
  end

  def show
    @user = User.find(params[:user_id])
    @movie = MoviesFacade.movie(params[:id])
    @reviews = MoviesFacade.movie_reviews(params[:id])
    @cast = MoviesFacade.ten_movie_cast(params[:id])
  end
end
