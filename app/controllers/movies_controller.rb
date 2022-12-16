class MoviesController < ApplicationController
  before_action :find_user

  def index
    if params[:search].present?
      @movies = MovieFacade.movie_search(params[:search])
    else
      @movies = MovieFacade.top_rated_movies
    end
  end

  def show
    @movie = MovieFacade.find_by_id(params[:id])
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end
end
