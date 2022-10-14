class UserMoviesController < ApplicationController

  def show
    @movie = MovieFacade.find_movie(params[:movie_id])

  end

end