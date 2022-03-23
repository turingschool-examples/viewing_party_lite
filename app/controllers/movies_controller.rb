class MoviesController < ApplicationController
  before_action :find_user_and_movie, only: [:show]
  before_action :find_user, only: [:index]

  def index
  end

  def show
  end

  private
  def find_user_and_movie
    @movie = Movie.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def find_user
    @user = User.find(params[:user_id])
  end
end