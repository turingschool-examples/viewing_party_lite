class Users::MoviesController < ApplicationController
  def index
    if params[:top_rated]
      @movies = MoviesFacade.top_rated
    elsif params[:search]
      @movies = MoviesFacade.search(params[:search])
    end

    def show
      
    end
  end
end