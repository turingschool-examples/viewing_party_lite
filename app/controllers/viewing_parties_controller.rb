class ViewingPartiesController < ApplicationController

  def new
    @movie = MovieFacade.new(params[:id])
  end
end
