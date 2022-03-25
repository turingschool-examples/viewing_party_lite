# frozen_string_literal: true

class MoviesController < ApplicationController
  before_action :find_user_and_movie, only: [:show]
  before_action :find_user, only: [:index]

  def index
    case params[:query]
    when 'top_rated'
      @data = MovieFacade.top_rated
    when 'movie_search'
      @data = MovieFacade.movie_title_search(params[:search])
    end
  end

  def show; end

  private

  def find_user_and_movie
    @movie = MovieFacade.movie_id_search(params[:id])
    @user = User.find(params[:user_id])
  end

  def find_user
    @user = User.find(params[:user_id])
  end
end
