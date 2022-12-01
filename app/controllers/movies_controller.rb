class MoviesController < ApplicationController
  def index
    if params.include? 'search'
      @search_results = MovieSearch.new.search_movies(params[:search])
    else
      @search_results = MovieSearch.new.top_rated_movie_list
    end
  end

  def show
    @movie = MovieSearch.new.retrieve_movie(params[:movie_id])
  end
end
