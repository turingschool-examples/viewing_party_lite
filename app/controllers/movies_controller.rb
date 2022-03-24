# frozen_string_literal: true

class MoviesController < ApplicationController
  def show
    @movie = MovieFacade.new(params[:id]).movie
    @reviews = ReviewFacade.new(params[:id]).reviews
    @cast = CastFacade.new(params[:id]).top_cast


  end

  def index
    if params[:top_rated]
      @user = User.find(params[:user_id])
      @top_rated = TopFacade.new.top_rated
    elsif params[:title]
      @user = User.find(params[:id])
      @movies = SearchFacade.search(params[:title])
    end
  end
end
