class MoviesController < ApplicationController
  before_action :find_user

  def index
    @movies = MovieFacade.movie_results(params[:search])
  end

  def show
  end
end
