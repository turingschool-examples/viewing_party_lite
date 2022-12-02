# frozen_string_literal: true

class MoviesController < ApplicationController
  before_action :find_user

  def index
    if params[:top_rated]
      @movies = MovieFacade.new(1).top_rated
    elsif params[:search]
      @movies = MovieFacade.new(params[:search]).searched_movies
    end
  end

  def show
    @movie = MovieFacade.new(params[:id])
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end
end
