class MoviesController < ApplicationController
  def index
    if params[:title] != nil
      @movies = MovieFacade.search(params[:title])
      
    else
      @movies = MovieFacade.top_rated
    end

    @user = User.find(params[:user_id])
  end

  def show 
    @user = User.find(params[:user_id])
    @movie = MovieFacade.find_movie(params[:id])
  end
end
