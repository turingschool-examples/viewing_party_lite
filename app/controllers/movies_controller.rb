# frozen_string_literal: true

class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])

    if params[:top_rated]
      @movies = MovieFacade.new(1).top_rated
    elsif params[:search]
      @movies = MovieFacade.new(params[:search]).searched_movies
    end
  end

  def show
    @user = User.find(params[:user_id])
    @movie = MovieFacade.new(params[:id])
  end
end
