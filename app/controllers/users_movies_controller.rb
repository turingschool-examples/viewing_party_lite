class UsersMoviesController < ApplicationController


  def index
    if params[:movie].present?
      movie = params[:movie]
      @movies = MovieFacade.get_a_movie(movie)
    end
  end


end