class MoviesController < ApplicationController
  def index
    @user = User.find(params[:id])
    @movies = if params[:keyword]
                MovieFacade.search(params[:keyword])
              else
                MovieFacade.top_movies
              end
  end


end
