# frozen_string_literal: true

class UserMoviesController < ApplicationController
  def index
    if params[:q] == 'top rated'
      @top_movies = MovieFacade.top_rated_movies
    elsif params[:search]
      @movie_search_results = MovieFacade.search(params[:search])
    end
  end

  def show
    @user = User.find(params[:user_id])
    @movie = MovieFacade.movie_details(params[:movie_id])
    @cast = if @movie.cast.length > 10
              @movie.cast[0..9]
            else
              @movie.cast
            end
  end
end
