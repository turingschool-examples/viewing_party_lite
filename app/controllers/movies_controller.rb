# frozen_string_literal: true

class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    if params[:q].present?
      @movies_array = MovieFacade.top_rated_poro
    elsif params[:search_movies].present?
      @movies_array = MovieFacade.search_poro(params[:search_movies])
    else
      redirect_to user_discover_path(@user)
      flash.notice = 'Must Select Top Rated Movies or Search for Keyword'
    end
  end

  def search
    @user = User.find(params[:user_id])
  end

  # Stephen edit
  def show
    @user = User.find(params[:user_id])
    @movie = MovieFacade.details_poro(params[:id])
    @movie_cast = MovieFacade.credits_poro(params[:id])
    @movie_reviews = MovieFacade.reviews_poro(params[:id])
  end
end
