# frozen_string_literal: true

class MoviesController < ApplicationController
  def show
    @movie = MovieFacade.new(params[:id]).movie
    @reviews = ReviewFacade.new(params[:id]).reviews
    @cast = CastFacade.new(params[:id]).top_cast
  end
end
