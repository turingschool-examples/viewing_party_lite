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
    @movie = MovieFacade.movie_details(params[:id])
    @user = User.find(params[:user_id])
  end
end
