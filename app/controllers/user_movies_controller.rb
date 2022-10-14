class UserMoviesController < ApplicationController

  def show
    @movie = MovieFacade.find_movie(params[:movie_id])
    @cast = MovieFacade.show(params[:movie_id])[:credits]
    @reviews = MovieFacade.show(params[:movie_id])[:reviews]
  end

end