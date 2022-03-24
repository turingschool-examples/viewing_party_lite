class MoviesController < ApplicationController
  def index
    @movies = MovieFacade.top_twenty
  end
end
