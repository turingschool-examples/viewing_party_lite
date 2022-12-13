# frozen_string_literal: true

class MoviesController < ApplicationController
  def index
    if params[:top_rated]
      @movies = MovieFacade.top_rated
    elsif params[:search]
      @movies = MovieFacade.searched_movies(params[:search])
    end
  end

  def show
    @movie = MovieFacade.movie_by_id(params[:id])
    @cast = MovieFacade.cast(params[:id])
    @reviews = MovieFacade.reviews(params[:id])
  end
end
