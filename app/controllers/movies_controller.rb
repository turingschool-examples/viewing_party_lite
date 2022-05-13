# frozen_string_literal: true

class MoviesController < ApplicationController
  before_action :get_user, only: %i[index show]

  def index
    if params[:query] == 'top40rated'
      @movies = MovieFacade.top_rated
    elsif params[:query]
      @movies = MovieFacade.find_movies(params[:query])
    end
  end

  def show
    @movie = MovieFacade.movie_info(params[:id])
  end

  private

  def get_user
    @user = User.find(params[:user_id])
  end
end
