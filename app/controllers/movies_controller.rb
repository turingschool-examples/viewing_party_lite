# frozen_string_literal: true

class MoviesController < ApplicationController
  def index
    if params[:q] == 'top rated'
      @top_movies = MovieFacade.top_rated_movies
    elsif params[:search].strip == ''
      redirect_to "/discover"
      flash[:alert] = 'Uh oh, something went wrong. Please try again.'
    elsif params[:search]
      @movie_search_results = MovieFacade.search(params[:search])
    end
  end

  def show
    @user = User.find(session[:user_id])
    @movie = MovieFacade.movie_details(params[:movie_id])
    @cast = @movie.cast[0..9]
  end
end
