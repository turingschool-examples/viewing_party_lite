class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @movies = if params[:keyword]
                MovieFacade.search(params[:keyword])
              else
                MovieFacade.top_movie
              end
  end

  def show
    @user = User.find(params[:user_id])
    @movie = MovieFacade.movie_details(params[:id])
  end
end
