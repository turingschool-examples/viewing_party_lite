class MoviesController < ApplicationController
  def index
    @movies = MovieFacade.keywords(params[:search])
  end
end
