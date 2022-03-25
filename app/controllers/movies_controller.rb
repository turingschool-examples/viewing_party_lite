class MoviesController < ApplicationController
  def index
    if params[:q] == 'top%20rated'
      @results = MovieFacade.top_twenty
    else
      @results = MovieFacade.search(params[:search])
    end
  end
end
