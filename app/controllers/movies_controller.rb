class MoviesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    if params[:search] == nil
      @movies = MovieFacade.top_rated_movies
    else
      @movies = MovieFacade.movie_search(params[:search])
    end
  end

  def show

  end

end
