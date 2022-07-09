class MoviesController < ApplicationController
  def index
    @user = User.find(params[:id])
    if params[:commit]
      @movies = MovieFacade.create_by_keyword(params[:q])
    else
      @movies = MovieFacade.create_top_rated
    end
  end
end
