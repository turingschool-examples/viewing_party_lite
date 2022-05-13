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
    @user = User.find(params[:user_id])
    @movie = MovieFacade.movie_details(params[:movie_id])
  end
end
