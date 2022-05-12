class ViewingPartiesController < ApplicationController
  def create
    @movie = MovieFacade.new(params[:id])
  end
end
