class MoviesController < ApplicationController
  def index
    @top_rated = MovieSearch.new.top_rated_movie_list
  end

  def show
    @movie = MovieSearch.new.retrieve_movie(params[:movie_id])
  end
end
