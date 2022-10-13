class MoviesController < ApplicationController
  def show
    @user = User.find(params[:user_id])
    @movie = MovieFacade.movie_details(params[:id])

  end

  def index
    @movies = if params[:search]
                MovieFacade.search_results(params[:search])
              else
                MovieFacade.top_20_movies
              end
    @user = User.find(params[:user_id])
  end


end
