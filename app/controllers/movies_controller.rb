class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    if params[:movie_search]
      @results = MovieService.new.search_movies(params[:movie_search])
    else
      @results = MovieService.new.top_rated_movies
    end
  end

  def show

  end
end
