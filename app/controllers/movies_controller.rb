class MoviesController < ApplicationController
  before_action :find_user, only: [:index]
  
  def index
    @movies = MovieFacade.create_top_movies
  end

  def show

  end
end
