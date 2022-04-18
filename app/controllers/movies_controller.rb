# frozen_string_literal: true

class MoviesController < ApplicationController
  def index
    @movies = MovieFacade.keywords(params[:search])
    @user = User.find(params[:user_id])
  end

  def show
    @user = User.find(params[:user_id])
    @movie = MovieFacade.get_movie(params[:id])
    @cast = MovieFacade.get_movie_cast(params[:id])
    @reviews = MovieFacade.get_reviews(params[:id])
  end
end
