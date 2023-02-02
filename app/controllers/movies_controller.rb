class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    if params[:movie_search]
      @results = MovieFacade.get_search_results(params[:movie_search])
    else
      @results = MovieFacade.top_rated_movies
    end
  end

  def show
    @user = User.find(params[:user_id])
    @movie = MovieFacade.get_details(params[:id])
  end
end
