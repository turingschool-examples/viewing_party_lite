class Users::MoviesController < ApplicationController
  before_action :set_user, only: %i[index show]

  def index
    if params[:top_rated]
      @movies = MoviesFacade.top_rated
    elsif params[:search]
      @movies = MoviesFacade.search(params[:search])
    end
  end

  def show
    @movie = MoviesFacade.details(params[:id])
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
