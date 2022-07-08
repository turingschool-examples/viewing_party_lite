# frozen_string_literal: true

class UserMoviesController < ApplicationController
  def index
    if params[:q] == 'top rated'
      @top_movies = MovieFacade.top_rated_movies
    elsif params[:search]
      @movie_search_results = MovieFacade.search(params[:search])
    end
  end
end
