class MoviesController < ApplicationController
  def index
    require "pry"; binding.pry
    if params[:q] == "top rated"
      MovieFacade.top_rated
    end
  end
end
