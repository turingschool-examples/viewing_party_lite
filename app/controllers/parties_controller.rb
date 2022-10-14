class PartiesController < ApplicationController

  def new
    @movie = MovieFacade.find_movie(params[:movie_id])
  end

  def create
    Party.create(movie_id: params[:movie_id], duration: params[:duration], date: params[:date], start_time: params[:start_time])
  end


end