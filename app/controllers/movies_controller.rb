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

  end
end
