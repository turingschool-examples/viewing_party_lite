class MoviesController < ApplicationController

  def index
    @top_movies = MovieFacade.create_movies
    
    @search_movie = MovieFacade.create_search_movie(params[:movie_title])
  end
end