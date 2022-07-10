class MoviesController < ApplicationController

  def index
    if params[:movie_title]
      @search_movie = MovieFacade.create_search_movie(params[:movie_title])
    elsif params[]
      @top_movies = MovieFacade.create_top_movies
    end
  end
end
