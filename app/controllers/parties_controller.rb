class PartiesController < ApplicationController
  def new

  end

  def create
    @movie = MovieSearch.new.retrieve_movie(params[:id])
  end
end
