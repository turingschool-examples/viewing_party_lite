class MoviesController < ApplicationController
  def index
    if params[:top] == true
      @movies = MovieFacade.top_twenty
    else
      @results = fds
    end
  end
end
