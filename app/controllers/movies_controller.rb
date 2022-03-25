# frozen_string_literal: true

class MoviesController < ApplicationController
  def show
    @movie = MovieFacade.movie(params[:id])
    @reviews = MovieFacade.reviews(params[:id])
    @cast = MovieFacade.cast(params[:id])
  end

  def index
    if params[:top_rated]
      @user = User.find(params[:user_id])
      @top_rated = MovieFacade.top_rated
    elsif params[:title]
      @user = User.find(params[:id])
      @movies = SearchFacade.search(params[:title]).sort_by{|movie| -movie.vote_average}
    end
  end
end
