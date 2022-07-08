class MoviesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    # @movies = MovieFacade.all 
    if params[:keyword].present?
     @movies = MovieFacade.movie_search(params[:keyword])
    else 
     @movies = MovieFacade.top_movies 
    end 
  end
end