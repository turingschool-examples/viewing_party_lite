class MoviesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    if params[:keyword].present?
     @movies = MovieFacade.movie_search(params[:keyword])
    else 
     @movies = MovieFacade.top_movies 
    end 
  end

  def show
    @user = User.find(params[:user_id])
    @movie = MovieFacade.search_by_id(params[:id])
  end
end