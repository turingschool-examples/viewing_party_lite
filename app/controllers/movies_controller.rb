class MoviesController < ApplicationController
  def index
    movies = MovieService.get_top_rated
  end
  def results

    @user = User.find(params[:id])
    if params[:q] == "top rated"
      @movies = MovieFacade.top_rated
    end
  end

  def show
    #binding.pry
    @user = User.find(params[:user_id])
    @movie = MovieFacade.find_movie(params[:id])

  end
end
