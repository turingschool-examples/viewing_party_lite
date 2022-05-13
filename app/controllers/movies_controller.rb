class MoviesController < ApplicationController
  def index
    @movies = if params[:top_movies]
      MovieFacade.create_top_rated_movies
    else
      MovieFacade.create_search_movies(params[:query])
    end
  end

  def discover
  end

  def show
    binding.pry
    @movie = Movie.find(params[:id])
  end
end
