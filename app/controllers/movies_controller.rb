class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @movies = if params[:q]
      MovieFacade.popular_movies
    elsif params[:keyword]
      MovieFacade.movie_search
    else
      []
    end
  end

  def show
    @user = User.find(params[:user_id])
    @movie = MovieFacade.movie_details(params[:id])
    @cast = MovieFacade.cast(params[:id]).take(10)
    @reviews = MovieFacade.reviews(params[:id])
  end
end
