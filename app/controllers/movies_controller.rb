class MoviesController < ApplicationController
  def discover
    @user = User.find(params[:id])
  end

  def show
  end

  def results
    if params[:q] == 'top rated' 
      @facade = MovieFacade.top_rated
    else
      # @facade = MovieFacade.search
    end
  end

  def top 
    
  end
end