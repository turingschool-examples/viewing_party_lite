class PartiesController < ApplicationController
  def new
    movie_search = MovieSearch.new
    @movie = movie_search.retrieve_movie(params[:movie_id])
  end

  def create
    @movie = MovieSearch.new.retrieve_movie(params[:id])
  end
end
