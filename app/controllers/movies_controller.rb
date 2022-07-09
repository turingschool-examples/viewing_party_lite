class MoviesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    # @movies = MovieFacade.all
    if params[:keyword].present?
     @movies = MovieFacade.movie_search(params[:keyword])
    else
     @movies = MovieFacade.top_movies
    end
  end

  def show
    @user = User.find(params[:user_id])
    # @movies = MovieFacade.movie_search(params[:keyword])
    @movie = MovieFacade.search_by_id(params[:id])
    @cast = MovieFacade.movie_cast(params[:id])
    @review = MovieFacade.movie_reviews(params[:id])
  end
end
