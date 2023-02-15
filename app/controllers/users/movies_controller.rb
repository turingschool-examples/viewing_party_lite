class Users::MoviesController < ApplicationController
  def index
    return @movies = MovieFacade.search_results(params[:query]) if params[:query]

    @movies = MovieFacade.top_rated_movies
  end

  def show
    @movie = MovieFacade.find_movie(params[:id]) 
    @actors = MovieFacade.cast_by_popularity(params[:id])
    @reviews = MovieFacade.find_reviews(params[:id])
  end
end