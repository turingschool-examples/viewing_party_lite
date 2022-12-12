# frozen_string_literal: true

class MoviesController < ApplicationController
  before_action :find_user

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

  private

  def find_user
    @user = User.find(params[:user_id])
  end
end
