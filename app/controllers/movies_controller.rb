class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])

    if params[:top_movies]
      @movies = MovieFacade.top_movies
    elsif params[:search]
      @movies = MovieFacade.search_movie(params[:search])
    end
  end

  def show
    @reviews = MovieFacade.movie_reviews(params[:id])
  end
end