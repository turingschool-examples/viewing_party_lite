# frozen_string_literal: true

class MoviesController < ApplicationController
  def discover
    @user = User.find(params[:user_id])
  end

  def index
    @user = User.find(params[:user_id])
    @movies = if params[:q].present?
                MovieFacade.movie_search(params[:q])
              else
                MovieFacade.top_rated
              end
  end

  def show
    movie_id = params[:id]
    @movie_details = MovieFacade.movie_details(movie_id)
    # binding.pry
  end
end
