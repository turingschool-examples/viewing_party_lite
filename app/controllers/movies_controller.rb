# frozen_string_literal: true

class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    if params[:search].present?
      @movies = MovieFacade.movie_search(params[:search])
    elsif @movies = MovieFacade.create_top_20_movies
    else
      params[:search].blank?
      redirect_to user_discover_index_path(@user)
    end
  end

  def show
    @user = User.find(params[:user_id])
    @movie = MovieFacade.create_individual_movie(params[:id])
    @cast = MovieFacade.create_cast(params[:id])
    @reviews = MovieFacade.create_reviews(params[:id])
  end
end
