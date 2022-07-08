class MoviesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    if params[:search] && params[:search].blank?
      @movies = []
    elsif params[:search]
      @movies = MovieFacade.new.search_movie(params[:search])
    else
      @movies = MovieFacade.new.return_top_40_movies
    end
  end
end
