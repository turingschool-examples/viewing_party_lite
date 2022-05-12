class ViewingPartiesController < ApplicationController

  def new
    @movie = MovieFacade.new(params[:id])
  end

  def create
    @movie = MovieFacade.new(params[:id])
  end
end
