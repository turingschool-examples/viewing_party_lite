class MoviesController < ApplicationController
  def discover
    @user = User.find(params[:id])
  end

  def show
  end

  def results
    if params[:q] == 'top rated' 
      @movies = MovieFacade.get_top_rated
      @user = User.find(params[:id])
    else
      # @facade = MovieFacade.search
    end
  end
end