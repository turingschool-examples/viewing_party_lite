class MoviesController < ApplicationController
  def index
    @user = User.find(params[:id])

    if params[:keyword]
      @movies = MovieFacade.search(params[:keyword])
    else
      @movies = MovieFacade.top_rated_movies
    end
  end

  def show
    @user = User.find(params[:id])
  end
end
