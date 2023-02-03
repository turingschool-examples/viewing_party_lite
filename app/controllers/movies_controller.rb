class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])

    if(params[:keyword])
      @search_movies = MovieFacade.search_results(params[:keyword])
    else
      @top_movies = MovieFacade.top_rated_results
    end
    
  end

  def show
    @user = User.find(params[:user_id])
    @movie = MovieFacade.all_movie_info(params[:id])
  end
end