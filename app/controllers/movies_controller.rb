class MoviesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    if params[:search] == nil
      @movies = MovieFacade.top_rated_movies
    else
      @movies = MovieFacade.movie_search(params[:search])
    end
  end

  def show
    @user = User.find(params[:user_id])
    @movie_details = MovieFacade.movie_details(params[:id])
    @movie_cast = MovieFacade.movie_credit(params[:id])[0..9]
    @movie_reviews = MovieFacade.movie_reviews(params[:id])
  end

end
