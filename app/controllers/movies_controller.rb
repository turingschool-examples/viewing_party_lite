class MoviesController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    @movies = if params[:keyword]
                MovieFacade.search(params[:keyword])
              else
                MovieFacade.top_movies
              end
  end

  def show
    @user = User.find(params[:user_id])
    @movie = MovieFacade.search_by_id(params[:id])
  end
end
