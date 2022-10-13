class MoviesController < ApplicationController
  def show
    
  end

  def index
    @movies = if params[:search]
                MovieFacade.search_results(params[:search])
              else
                MovieFacade.top_20_movies
              end
    @user = User.find(params[:user_id])
  end


end
