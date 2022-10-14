class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @movies = if params[:search].present?
      MovieFacade.movie_search(params[:search])
    else
      MovieFacade.top_rated
    end
  end

  def show
    @user = User.find(params[:user_id])
    @movie = MovieFacade.find(params[:id])
    @reviews = MovieFacade.get_reviews(params[:id])
    @cast = MovieFacade.get_cast(params[:id]).first(10)
  end
end
